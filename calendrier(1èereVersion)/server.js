// server.js
// Backend minimal pour l'application de planification de rencontre de thèse

const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

// --- Configuration de base ---
const app  = express();
const PORT = process.env.PORT || 3000;

// Fichier JSON pour stocker les disponibilités
const DATA_DIR  = path.join(__dirname, 'data');
const DATA_FILE = path.join(DATA_DIR, 'availabilities.json');

// Participants autorisés (mêmes clés que dans le frontend)
const PARTICIPANTS = ['dominique', 'roger', 'janie'];

// --- Middlewares ---
app.use(cors());
app.use(express.json());

// Servir les fichiers statiques (page HTML, images, etc.)
app.use(express.static(path.join(__dirname, 'public')));

// --- Fonctions utilitaires pour gérer le fichier JSON ---

// S'assure que le dossier et le fichier existent
function ensureDataFile() {
  if (!fs.existsSync(DATA_DIR)) {
    fs.mkdirSync(DATA_DIR, { recursive: true });
  }
  if (!fs.existsSync(DATA_FILE)) {
    const initial = { slots: {} };
    fs.writeFileSync(DATA_FILE, JSON.stringify(initial, null, 2), 'utf8');
  }
}

// Charge les données depuis le disque
function loadData() {
  try {
    ensureDataFile();
    const raw = fs.readFileSync(DATA_FILE, 'utf8');
    const json = JSON.parse(raw);
    if (!json.slots || typeof json.slots !== 'object') {
      return { slots: {} };
    }
    return json;
  } catch (e) {
    return { slots: {} };
  }
}

// Sauvegarde les données sur le disque
function saveData(data) {
  ensureDataFile();
  const text = JSON.stringify(data, null, 2);
  fs.writeFileSync(DATA_FILE, text, 'utf8');
}

// --- Routes API ---

// GET /api/slots : renvoie toutes les disponibilités
app.get('/api/slots', (req, res) => {
  const data = loadData();
  res.json(data);
});

// POST /api/slots : met à jour une disponibilité
// Body JSON attendu : { participant, date, period, available }
app.post('/api/slots', (req, res) => {
  const { participant, date, period, available } = req.body || {};

  if (!participant || !PARTICIPANTS.includes(participant)) {
    return res.status(400).json({ error: 'Participant invalide.' });
  }

  if (!date || typeof date !== 'string') {
    return res.status(400).json({ error: 'Date manquante ou invalide.' });
  }

  // period est ici "09:00", "10:00", etc.
  const validPeriods = ['09:00', '10:00', '11:00', '13:00', '14:00', '15:00'];
  if (!period || !validPeriods.includes(period)) {
    return res.status(400).json({ error: 'Période invalide.' });
  }

  const data = loadData();
  const key = `${date}|${period}`;

  if (!data.slots[key]) {
    data.slots[key] = {};
  }

  data.slots[key][participant] = !!available;

  saveData(data);

  res.json({ success: true, key, value: data.slots[key] });
});

// Fallback pour toutes les routes non-API : renvoyer la page principale
app.use((req, res, next) => {
  if (req.path.startsWith('/api/')) {
    return next();
  }
  res.sendFile(path.join(__dirname, 'public', 'rdv-these.html'));
});


// --- Démarrage du serveur ---
app.listen(PORT, () => {
  console.log(`Serveur de planification de thèse en écoute sur http://localhost:${PORT}`);
});
