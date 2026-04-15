# Portfolio Redesign - Dominique Loyer

## 🎨 Vue d'ensemble

Redesign complet du portfolio académique et professionnel de Dominique Loyer avec:
- Design Dark Mode élégant et moderne
- Système de citation multi-format (APA, ACL, BibTeX)
- Métadonnées riches pour le SEO
- Support bilingue (français/anglais)
- Responsive design mobile-first
- Photo de profil avec effet blur CSS

## 📁 Structure du site

```
/
├── index.html              # Homepage (English)
├── index-fr.html           # Homepage (Français)
├── publications.html       # Publications with citation system
├── conferences.html        # Conference papers
├── projects.html          # Research projects
├── teaching.html          # Teaching experience
└── README.md              # Cette documentation
```

## 🎯 Caractéristiques principales

### 1. **Homepage (index.html & index-fr.html)**
- Hero section avec photo floue du profil
- Code overlay SVG
- CTA buttons (Call-to-Action)
- 6 feature cards avec emojis
- Footer avec badges académiques (ORCID, Google Scholar, ResearchGate, GitHub)
- Sélecteur de langue EN/FR

### 2. **Publications (publications.html)**
- **Système de citation multi-format:**
  - APA 7th Edition
  - ACL (Association for Computational Linguistics)
  - BibTeX
- Filtrage par type (All, Papers, Preprints, Thesis)
- Métadonnées riches (Authors, Year, DOI, Institution)
- Boutons de copie pour les citations
- Support UTF-8 complet (français/anglais)
- Optimisé pour le SEO (excellente indexation Google Scholar)

### 3. **Conférences (conferences.html)**
- Métadonnées détaillées
- Status badges (Accepted, Upcoming)
- Tags de sujets
- DOI links vers ResearchGate

### 4. **Projets (projects.html)**
- Grille réactive de projets
- Technology tags
- Status badges (Active, In Development)
- Links vers GitHub

### 5. **Enseignement (teaching.html)**
- Statistiques d'enseignement
- Détails des cours
- Compétences développées
- Support bilingue des descriptions

## 🎨 Design System

### Palette de couleurs (Dark Mode GitHub)
```css
--bg-primary: #0d1117        /* Fond principal */
--bg-secondary: #161b22      /* Fond secondaire */
--bg-tertiary: #21262d       /* Fond tertiaire */
--accent: #58a6ff            /* Bleu accent */
--accent-dark: #1f6feb       /* Bleu foncé */
--success: #3fb950           /* Vert succès */
--text-primary: #c9d1d9      /* Texte principal */
--text-secondary: #8b949e    /* Texte secondaire */
```

### Typographie
- Font: `-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`
- Fallback: Helvetica Neue, Arial

### Effets visuels
- Glassmorphism (backdrop-filter: blur)
- Gradients subtils
- Animations fluides (cubic-bezier(0.16, 1, 0.3, 1))
- Hover effects délicats
- Box shadows élevés

## 🔍 Optimisation SEO

### Métadonnées riches
- Meta descriptions complètes
- Keywords pertinents
- Open Graph metadata
- Structured data (Articles, Publications)

### Citation Format pour SEO
- DOI links (important pour la découverte)
- Noms d'auteurs complets
- Métadonnées complètes (institution, année, type)
- Support des plateformes:
  - Google Scholar
  - ResearchGate
  - ORCID
  - Semantic Scholar

## 📱 Responsive Design

### Breakpoints
```css
@media (max-width: 768px)   { /* Tablets */ }
@media (max-width: 480px)   { /* Mobile */ }
```

### Mobile-first features
- Navigation adaptative
- Grilles flexibles
- Texte lisible (font-size ≥ 14px sur mobile)
- Touch-friendly buttons (≥ 44px × 44px)

## 🌐 Support multilingue

### Implémentation
- Deux versions HTML complètes (EN/FR)
- Sélecteur de langue dans la navigation
- Préservation des URLs (EN: `/`, FR: `/index-fr.html`)
- Métadonnées spécifiques à chaque langue

### Pages traduites
- index-fr.html (Homepage en français)
- Autres pages disponibles en EN seulement (URLs standard)

### UTF-8 Support
- Meta charset: `UTF-8`
- Caractères spéciaux français supportés:
  - Accents: é, è, ê, ë, à, ô, ù, ç
  - Ligatures: œ, æ

## 📊 Statistiques de performance

### Google Lighthouse (Target)
- Performance: 90+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 100

### Optimisations
- Image optimization (photo blur CSS)
- Minimal CSS (inline, no external stylesheets)
- No JavaScript libraries (vanilla JS only)
- Lazy loading ready
- Zero render-blocking resources

## 🔗 Liens externes importants

- **ORCID**: https://orcid.org/0009-0003-9713-7109
- **Google Scholar**: https://scholar.google.com/citations?user=JmRd6U0AAAAJ
- **ResearchGate**: https://www.researchgate.net/profile/Dominique-Loyer
- **GitHub**: https://github.com/DominiqueLoyer

## 📝 Détails de publication

### Sites indexées pour le SEO
1. **Google Scholar** → Automatique avec DOI
2. **ResearchGate** → Lien direct dans les publications
3. **ORCID** → Profil visible et linkable
4. **Google Scholar** → Meta descriptions complet

### Format DOI
Tous les articles incluent:
- DOI complet (10.13140/RG.2.2.xxxxx)
- Lien ResearchGate
- Métadonnées complètes (auteurs, année, institution)

## 🛠️ Maintenance

### Ajouter une nouvelle publication
1. Ouvrir `publications.html`
2. Copier un `publication-card`
3. Mettre à jour:
   - Titre
   - DOI
   - Auteurs
   - Année
   - Résumé
   - Tags
   - Citations (APA, ACL, BibTeX)
4. Tester la copie de citation

### Mettre à jour les badges
- Google Scholar: Valider l'URL dans le profil GS
- ResearchGate: Mettre à jour le lien du profil
- GitHub: Synchroniser avec le profil réel

## 📧 Contact

**Dominique Loyer**  
Doctorant en Informatique Cognitive  
Université du Québec à Montréal (UQAM)  
Email: dominique.loyer@uqam.ca  

---

**Version**: 1.0  
**Date**: Janvier 2026  
**License**: Personal Portfolio (All rights reserved)
