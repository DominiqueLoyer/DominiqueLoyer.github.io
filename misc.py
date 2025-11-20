``` Python
from tweepy.streaming import StreamListener  
from tweepy import OAuthHandler  
from tweepy import Stream  
   
import twitter_credentials  
   
# # # # TWITTER STREAMER # # # #  
class TwitterStreamer():  
    """  
    Class for streaming and processing live tweets.    """    def __init__(self):  
        pass  
  
    def stream_tweets(self, fetched_tweets_filename, hash_tag_list):  
        # This handles Twitter authetification and the connection to Twitter Streaming API  
        listener = StdOutListener(fetched_tweets_filename)  
        auth = OAuthHandler(twitter_credentials.CONSUMER_KEY, twitter_credentials.CONSUMER_SECRET)  
        auth.set_access_token(twitter_credentials.ACCESS_TOKEN, twitter_credentials.ACCESS_TOKEN_SECRET)  
        stream = Stream(auth, listener)  
  
        # This line filter Twitter Streams to capture data by the keywords:   
stream.filter(track=hash_tag_list)  
  
  
# # # # TWITTER STREAM LISTENER # # # #  
class StdOutListener(StreamListener):  
    """  
    This is a basic listener that just prints received tweets to stdout.    """    def __init__(self, fetched_tweets_filename):  
        self.fetched_tweets_filename = fetched_tweets_filename  
  
    def on_data(self, data):  
        try:  
            print(data)  
            with open(self.fetched_tweets_filename, 'a') as tf:  
                tf.write(data)  
            return True  
        except BaseException as e:  
            print("Error on_data %s" % str(e))  
        return True  
            
    def on_error(self, status):  
        print(status)  
  
   
if __name__ == '__main__':  
   
    # Authenticate using config.py and connect to Twitter Streaming API.  
    hash_tag_list = ["donal trump", "hillary clinton", "barack obama", "bernie sanders"]  
    fetched_tweets_filename = "tweets.txt"  
  
    twitter_streamer = TwitterStreamer()  
    twitter_streamer.stream_tweets(fetched_tweets_filename, hash_tag_list)

```

# RDF python

```Python
!pip install rdflib  
  
#%%  
from rdflib import Graph  
#%%  
!pip show rdflib  
#%%  
filename = "ex001.rq"  
  
  
g = rdflib.Graph()  
  
result = g.parse(filename, format='rq')  
print(result)  
  
query = """  
  
SELECT ?person  
WHERE {  
    ?person <http://dbpedia.org/ontology/hasName> "Idham Al-Taif Mahmoud"}  
  
"""  
  
g.query(query)  
for stmt in g:  
    print(stmt)  
#%%  
result = g.parse =('http://dbpedia.org/ressource/Michael_Jackson')  
#%%  
filename = "turle.ttl"  
  
  
g = rdflib.Graph()  
  
result = g.parse(filename, format='ttl')  
print(result)  
  
query = """  
  
SELECT ?person  
WHERE {  
    ?person <http://dbpedia.org/ontology/hasName> "Idham Al-Taif Mahmoud"}  
  
"""  
  
g.query(query)  
for stmt in g:  
    print(stmt)  
#%%  
print(result)  
#%%  
query = """  
  
SELECT ?person  
WHERE {  
    ?person <http://dbpedia.org/ressource/Michael_Jackson> "Michael Jackson"}  
  
"""  
#%%  
g.query(query)  
for stmt in g:  
    print(stmt  
#%%  
print(stmt)  
#%%  
print(query)  
#%%  
g.query(query)  
for stmt in g:  
    print(stmt  
#%%  
g.query(query)  
for stmt in g:  
    print(stmt)  
#%%  
query = PREFIX d: <http://learningsparql.com/ns/demo#> SELECT ?person  
WHERE  
{ ?person d:homeTel "(229) 276-5135" . }    
#%%  
query = """  
  
PREFIX d: <http://learningsparql.com/ns/demo#> SELECT ?person  
WHERE  
{ ?person d:homeTel "(229) 276-5135" . }    
"""  
#%%  
print(query)  
#%%  
arq --data ex002.ttl --query ex003.rq

```
# Random forest Iris
```python
#%%  
import numpy as np  
from sklearn.model_selection import train_test_split  
from sklearn import datasets  
from sklearn import svm  
  
iris = datasets.load_iris()  
iris.data.shape, iris.target.shape  
#%%  
X_train, X_test, y_train, y_test = train_test_split(  
    iris.data, iris.target, test_size=0.4, random_state=0)  
  
X_train.shape, y_train.shape  
  
X_test.shape, y_test.shape  
  
  
clf = svm.SVC(kernel='linear', C=1).fit(X_train, y_train)  
clf.score(X_test, y_test)                             
  
#%%  
from sklearn.model_selection import cross_val_score  
clf = svm.SVC(kernel='linear', C=1)  
scores = cross_val_score(clf, iris.data, iris.target, cv=5)  
scores      
#%%  
print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))  
#%%
```
# knn classifier IRIS
```python
from sklearn.datasets import load_iris  
from sklearn.model_selection import train_test_split  
from sklearn.neighbors import KNeighborsClassifier  
from sklearn.metrics import accuracy_score  
  
# Load Iris dataset (a well-known classification dataset)  
iris = load_iris()  
X = iris.data  
y = iris.target  
  
# Split the data into training and testing sets  
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)  
  
# Create KNeighborsClassifier with k=3  
knn_classifier = KNeighborsClassifier(n_neighbors=3)  
  
# Fit the classifier on the training data  
knn_classifier.fit(X_train, y_train)  
  
# Make predictions on the test set  
predictions = knn_classifier.predict(X_test)  
  
# Calculate accuracy  
accuracy = accuracy_score(y_test, predictions)  
print("Accuracy:", accuracy)

```
# Tensor Flow

```python
# Import TensorFlow  
import tensorflow as tf  
from tensorflow.keras.models import Sequential  
from tensorflow.keras.layers import Dense  
  
# Sample dataset (replace this with your dataset)  
# Assuming X_train and y_train are your input and output data  
# Modify this according to your actual dataset  
X_train = ...  # Your input data  
y_train = ...  # Your output data  
  
# Define the neural network model  
model = Sequential([  
    Dense(64, activation='relu', input_shape=(input_shape,)),  # Add a hidden layer with 64 neurons and ReLU activation  
    Dense(32, activation='relu'),  # Add another hidden layer with 32 neurons and ReLU activation  
    Dense(1, activation='sigmoid')  # Output layer with 1 neuron for binary classification (sigmoid activation)  
])  
  
# Compile the model  
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])  
  
# Train the model  
model.fit(X_train, y_train, epochs=10, batch_size=32)  # Adjust epochs and batch_size as needed
```
# Time Series

```python
#%%  
import warnings  
import itertools  
import numpy as np  
import matplotlib.pyplot as plt  
warnings.filterwarnings("ignore")  
plt.style.use('fivethirtyeight')  
import pandas as pd  
import statsmodels.api as sm  
import matplotlib  
  
matplotlib.rcParams['axes.labelsize'] = 14  
matplotlib.rcParams['xtick.labelsize'] = 12  
matplotlib.rcParams['ytick.labelsize'] = 12  
matplotlib.rcParams['text.color'] = 'k'  
#%%  
We are going to do time series analysis and forecasting for furniture sales.  
#%%  
df = pd.read_excel("Superstore.xls")  
furniture = df.loc[df['Category'] == 'Furniture']  
#%% md  
We have a good 4-year furniture sales data.   
#%%  
furniture['Order Date'].min()  
#%%  
furniture['Order Date'].max()  
#%% md  
## Data preprocessing  
  
This step includes removing columns we do not need, check missing values, aggregate sales by date and so on.  
#%%  
cols = ['Row ID', 'Order ID', 'Ship Date', 'Ship Mode', 'Customer ID', 'Customer Name', 'Segment', 'Country', 'City', 'State', 'Postal Code', 'Region', 'Product ID', 'Category', 'Sub-Category', 'Product Name', 'Quantity', 'Discount', 'Profit']  
furniture.drop(cols, axis=1, inplace=True)  
furniture = furniture.sort_values('Order Date')  
#%%  
furniture.isnull().sum()  
#%%  
furniture = furniture.groupby('Order Date')['Sales'].sum().reset_index()  
#%%  
furniture.head()  
#%% md  
## Indexing with time series data  
#%%  
furniture = furniture.set_index('Order Date')  
furniture.index  
#%% md  
Our current datetime data can be tricky to work with, therefore, we will use the averages daily sales value for that month instead, and we are using the start of each month as the timestamp.  
#%%  
y = furniture['Sales'].resample('MS').mean()  
#%% md  
Have a quick peek 2017 sales data.  
#%%  
y['2017':]  
#%% md  
## Visualizing furniture sales time series data  
#%%  
y.plot(figsize=(15, 6))  
plt.show()  
#%% md  
Some distinguishable patterns appear when we plot the data. The time-series has seasonality pattern, such as sales are always low at the beginning of the year and high at the end of the year. There is always a strong upward trend within any single year with a couple of low months in the mid of the year.  
  
We can also visualize our data using a method called time-series decomposition that allows us to decompose our time series into three distinct components: trend, seasonality, and noise.  
#%%  
from pylab import rcParams  
rcParams['figure.figsize'] = 18, 8  
  
decomposition = sm.tsa.seasonal_decompose(y, model='additive')  
fig = decomposition.plot()  
plt.show()  
#%% md  
The plot above clearly shows that the sales of furniture is unstable, along with its obvious seasonality.  
#%% md  
## Time series forecasting with ARIMA  
  
We are going to apply one of the most commonly used method for time-series forecasting, known as ARIMA, which stands for Autoregressive Integrated Moving Average.  
  
Parameter Selection for the ARIMA Time Series Model  
#%%  
p = d = q = range(0, 2)  
pdq = list(itertools.product(p, d, q))  
seasonal_pdq = [(x[0], x[1], x[2], 12) for x in list(itertools.product(p, d, q))]  
  
print('Examples of parameter combinations for Seasonal ARIMA...')  
print('SARIMAX: {} x {}'.format(pdq[1], seasonal_pdq[1]))  
print('SARIMAX: {} x {}'.format(pdq[1], seasonal_pdq[2]))  
print('SARIMAX: {} x {}'.format(pdq[2], seasonal_pdq[3]))  
print('SARIMAX: {} x {}'.format(pdq[2], seasonal_pdq[4]))  
#%%  
for param in pdq:  
    for param_seasonal in seasonal_pdq:  
        try:  
            mod = sm.tsa.statespace.SARIMAX(y,  
                                            order=param,  
                                            seasonal_order=param_seasonal,  
                                            enforce_stationarity=False,  
                                            enforce_invertibility=False)  
  
            results = mod.fit()  
  
            print('ARIMA{}x{}12 - AIC:{}'.format(param, param_seasonal, results.aic))  
        except:  
            continue  
#%%  
mod = sm.tsa.statespace.SARIMAX(y,  
                                order=(1, 1, 1),  
                                seasonal_order=(1, 1, 0, 12),  
                                enforce_stationarity=False,  
                                enforce_invertibility=False)  
  
results = mod.fit()  
  
print(results.summary().tables[1])  
#%%  
results.plot_diagnostics(figsize=(16, 8))  
plt.show()  
#%% md  
## Validating forecasts  
  
To help us understand the accuracy of our forecasts, we compare predicted sales to real sales of the time series, and we set forecasts to start at 2017-07-01 to the end of the data.  
#%%  
pred = results.get_prediction(start=pd.to_datetime('2017-01-01'), dynamic=False)  
pred_ci = pred.conf_int()  
  
ax = y['2014':].plot(label='observed')  
pred.predicted_mean.plot(ax=ax, label='One-step ahead Forecast', alpha=.7, figsize=(14, 7))  
  
ax.fill_between(pred_ci.index,  
                pred_ci.iloc[:, 0],  
                pred_ci.iloc[:, 1], color='k', alpha=.2)  
  
ax.set_xlabel('Date')  
ax.set_ylabel('Furniture Sales')  
plt.legend()  
  
plt.show()  
#%% md  
The line plot is showing the observed values compared to the rolling forecast predictions. Overall, our forecasts align with the true values very well, showing an upward trend starts from the beginning of the year.  
#%%  
y_forecasted = pred.predicted_mean  
y_truth = y['2017-01-01':]  
  
# Compute the mean square error  
mse = ((y_forecasted - y_truth) ** 2).mean()  
print('The Mean Squared Error of our forecasts is {}'.format(round(mse, 2)))  
#%%  
print('The Root Mean Squared Error of our forecasts is {}'.format(round(np.sqrt(mse), 2)))  
#%% md  
In statistics, the mean squared error (MSE) of an estimator measures the average of the squares of the errors — that is, the average squared difference between the estimated values and what is estimated. The MSE is a measure of the quality of an estimator—it is always non-negative, and the smaller the MSE, the closer we are to finding the line of best fit.  
  
Root Mean Square Error (RMSE) tells us that our model was able to forecast the average daily furniture sales in the test set within 151.64 of the real sales. Our furniture daily sales range from around 400 to over 1200. In my opinion, this is a pretty good model so far.  
#%% md  
## Producing and visualizing forecasts  
#%%  
pred_uc = results.get_forecast(steps=100)  
pred_ci = pred_uc.conf_int()  
  
ax = y.plot(label='observed', figsize=(14, 7))  
pred_uc.predicted_mean.plot(ax=ax, label='Forecast')  
ax.fill_between(pred_ci.index,  
                pred_ci.iloc[:, 0],  
                pred_ci.iloc[:, 1], color='k', alpha=.25)  
ax.set_xlabel('Date')  
ax.set_ylabel('Furniture Sales')  
  
plt.legend()  
plt.show()  
#%% md  
Our model clearly captured furniture sales seasonality. As we forecast further out into the future, it is natural for us to become less confident in our values. This is reflected by the confidence intervals generated by our model, which grow larger as we move further out into the future.  
#%% md  
The above time series analysis for furniture makes me curious about other categories, and how do they compare with each other onver time. Therefore, we are going to compare time series of furniture and office supplier.  
#%% md  
## Time Series comparison furniture sales and Office Supplies  
  
### Data Preprocessing  
#%%  
furniture = df.loc[df['Category'] == 'Furniture']  
office = df.loc[df['Category'] == 'Office Supplies']  
#%% md  
According to our data, there were way more number of sales from Office Supplies than from Furniture over the years.  
#%%  
furniture.shape, office.shape  
#%%  
cols = ['Row ID', 'Order ID', 'Ship Date', 'Ship Mode', 'Customer ID', 'Customer Name', 'Segment', 'Country', 'City', 'State', 'Postal Code', 'Region', 'Product ID', 'Category', 'Sub-Category', 'Product Name', 'Quantity', 'Discount', 'Profit']  
furniture.drop(cols, axis=1, inplace=True)  
office.drop(cols, axis=1, inplace=True)  
  
furniture = furniture.sort_values('Order Date')  
office = office.sort_values('Order Date')  
  
furniture = furniture.groupby('Order Date')['Sales'].sum().reset_index()  
office = office.groupby('Order Date')['Sales'].sum().reset_index()  
#%% md  
Have a quick peek, perfect!  
#%%  
furniture.head()  
#%%  
office.head()  
#%% md  
### Data exploration  
  
We are going to compare two categories' sales in the same time period. This means combine two data frames into one and plot these two categories' time series into one plot.  
#%%  
furniture = furniture.set_index('Order Date')  
office = office.set_index('Order Date')  
  
y_furniture = furniture['Sales'].resample('MS').mean()  
y_office = office['Sales'].resample('MS').mean()  
  
furniture = pd.DataFrame({'Order Date':y_furniture.index, 'Sales':y_furniture.values})  
office = pd.DataFrame({'Order Date': y_office.index, 'Sales': y_office.values})  
  
store = furniture.merge(office, how='inner', on='Order Date')  
store.rename(columns={'Sales_x': 'furniture_sales', 'Sales_y': 'office_sales'}, inplace=True)  
store.head()  
#%%  
plt.figure(figsize=(20, 8))  
plt.plot(store['Order Date'], store['furniture_sales'], 'b-', label = 'furniture')  
plt.plot(store['Order Date'], store['office_sales'], 'r-', label = 'office supplies')  
plt.xlabel('Date'); plt.ylabel('Sales'); plt.title('Sales of Furniture and Office Supplies')  
plt.legend();  
#%% md  
We observe that sales of furniture and office supplies shared a similar seasonal pattern. Early of the year is the off season for both of the two categories. It seems summer time is quiet for office supplies too. in addition, average daily sales for furniture are higher than those of office supplies in most of the months. It is understandable, as the value of furniture should be much higher than those of office supplies. Occationaly, office supplies passed furnitue on average daily sales. Let's find out when was the first time office supplies' sales surpassed those of furniture's.   
#%%  
first_date = store.ix[np.min(list(np.where(store['office_sales'] > store['furniture_sales'])[0])), 'Order Date']  
  
print("Office supplies first time produced higher sales than furniture is {}.".format(first_date.date()))  
#%% md  
It was July 2014.  
#%% md  
### Time Series Modeling with Prophet  
  
Released by Facebook in 2017, forecasting tool Prophet is designed for analyzing time-series that display patterns on different time scales such as yearly, weekly and daily. It also has advanced capabilities for modeling the effects of holidays on a time-series and implementing custom changepoints. Therefore, we are using Prophet to get a model up and running.  
#%%  
from fbprophet import Prophet  
  
furniture = furniture.rename(columns={'Order Date': 'ds', 'Sales': 'y'})  
furniture_model = Prophet(interval_width=0.95)  
furniture_model.fit(furniture)  
  
office = office.rename(columns={'Order Date': 'ds', 'Sales': 'y'})  
office_model = Prophet(interval_width=0.95)  
office_model.fit(office)  
#%%  
furniture_forecast = furniture_model.make_future_dataframe(periods=36, freq='MS')  
furniture_forecast = furniture_model.predict(furniture_forecast)  
  
office_forecast = office_model.make_future_dataframe(periods=36, freq='MS')  
office_forecast = office_model.predict(office_forecast)  
#%%  
plt.figure(figsize=(18, 6))  
furniture_model.plot(furniture_forecast, xlabel = 'Date', ylabel = 'Sales')  
plt.title('Furniture Sales');  
#%%  
plt.figure(figsize=(18, 6))  
office_model.plot(office_forecast, xlabel = 'Date', ylabel = 'Sales')  
plt.title('Office Supplies Sales');  
#%% md  
### Compare Forecasts  
  
We already have the forecasts for three years for these two categories into the future. We will now join them together to compare their future forecasts.  
#%%  
furniture_names = ['furniture_%s' % column for column in furniture_forecast.columns]  
office_names = ['office_%s' % column for column in office_forecast.columns]  
  
merge_furniture_forecast = furniture_forecast.copy()  
merge_office_forecast = office_forecast.copy()  
  
merge_furniture_forecast.columns = furniture_names  
merge_office_forecast.columns = office_names  
  
forecast = pd.merge(merge_furniture_forecast, merge_office_forecast, how = 'inner', left_on = 'furniture_ds', right_on = 'office_ds')  
  
forecast = forecast.rename(columns={'furniture_ds': 'Date'}).drop('office_ds', axis=1)  
forecast.head()  
#%% md  
### Visualizing the trend and the forecast  
#%%  
plt.figure(figsize=(10, 7))  
plt.plot(forecast['Date'], forecast['furniture_trend'], 'b-')  
plt.plot(forecast['Date'], forecast['office_trend'], 'r-')  
plt.legend(); plt.xlabel('Date'); plt.ylabel('Sales')  
plt.title('Furniture vs. Office Supplies Sales Trend');  
#%%  
plt.figure(figsize=(10, 7))  
plt.plot(forecast['Date'], forecast['furniture_yhat'], 'b-')  
plt.plot(forecast['Date'], forecast['office_yhat'], 'r-')  
plt.legend(); plt.xlabel('Date'); plt.ylabel('Sales')  
plt.title('Furniture vs. Office Supplies Estimate');  
#%% md  
### Trends and Patterns  
  
Now, we can use the Prophet Models to inspect different trends of these two categories in the data.  
#%%  
furniture_model.plot_components(furniture_forecast);  
#%%  
office_model.plot_components(office_forecast);  
#%% md  
Good to see that the sales for both furniture and office supplies have been linearly increasing over time although office supplies' growth seems slightly stronger.  
  
The worst month for furniture is April, the worst month for office supplies is February. The best month for furniture is December, and the best month for office supplies is November.  
  
There are many time-series analysis we can explore from now on, such as forecast with uncertainty bounds, change point and anomaly detection, forecast time-series with external data source. We have only scratched the surface here. Stay tuned for future works on time-series analysis.  
#%%  
  
#%%
```
# Boucles et conditions
```python
  
[st= "x is same as y"

else:

st= "x is greater than y"

print (st)

  

# conditional statements let you use "a if C else b"

st = "x is less than y" if (x < y) else "x is greater than or equal to y"

print (st)](<```python
#
# Example file for working with conditional statements
#

def main():
  x, y = 10, 100
  
  # conditional flow uses if, elif, else  
  if(x %3C y):
    st= "x is less than y"
  elif (x == y):
    st= "x is same as y"
  else:
    st= "x is greater than y"
  print (st)

  # conditional statements let you use "a if C else b"
  st = "x is less than y" if (x < y) else "x is greater than or equal to y"
  print (st)
  
  # Python does not have support for higher-order conditionals
  # like "switch-case" in other languages
  
if __name__ == "__main__":
  main()


```


```python
#
# Example file for working with functions
#

# define a basic function
def func1():
  print ("I am a function")

# function that takes arguments
def func2(arg1, arg2):
  print (arg1, " ", arg2)

# function that returns a value
def cube(x):
  return x*x*x

# function with default value for an argument
def power(num, x=1):
  result = 1;
  for i in range(x):
    result = result * num  
  return result

[[function]] with variable number of arguments
def multi_add(*args):
  result = 0;
  for x in args:
    result = result + x
  return result

func1()
print (func1())
print (func1)
func2(10,20)
print (func2(10,20))
print (cube(3))
print (power(2))
print (power(2,3))
print (power(x=3, num=2))
print (multi_add(4,5,10,4))

```

    I am a function
    I am a function
    None
    <function func1 at 0x108d1cc80%3E
    10   20
    10   20
    None
    27
    2
    8
    8
    23


#
# Example file for working with classes
#


def main():

  
if __name__ == "__main__":
  main()




```python
#
# Example file for working with classes
#


def main():

  
    if __name__ == "__main__":
      main()

```

# Declare a variable and initialize it
f = 0
print (f)

# re-declaring the variable works
f = "abc"
print (f)

# ERROR: variables of different types cannot be combined
[[print]] ("string type " + 123)
print ("string type " + str(123))

# Global vs. local variables in functions
def someFunction():
  [[global]] f
  f = "def"
  print (f)

someFunction()
print (f) 

del f
print (f)



```python
#
# Example file for working with loops
#

def main():
  x = 0
  
  # define a while loop
  while (x < 5):
     print (x)
     x = x + 1

  # define a for loop
  for x in range(5,10):
    print (x)
    
  # use a for loop over a collection
  days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
  for d in days:
    print (d)
  
  # use the break and continue statements
  for x in range(5,10):
    [[if]] (x == 7): break
    [[if]] (x % 2 == 0): continue
    print (x)
  
  [[using]] the enumerate() function to get index 
  days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
  for i, d in enumerate(days):
    print (i, d)
  
if __name__ == "__main__":
  main()

```

    


```python
#
# Read and write files using the built-in Python file methods
#

def main():  
  # Open a file for writing and create it if it doesn't exist
  f = open("info_pdo.csv","w+")
  
  # Open the file for appending text to the end
  # f = open("textfile.txt","a+")

  # write some lines of data to the file
  for i in range(10):
    f.write("This is line %d\r\n" % (i+1))
  
  # close the file when done
  f.close()
  
  # Open the file back up and read the contents
  f = open("info_pdo.csv","r")
  if f.mode == 'r': # check to make sure that the file was opened
    # use the read() function to read the entire file
    # contents = f.read()
    # print (contents)
    
    fl = f.readlines() # readlines reads the individual lines into a list
    for x in fl:
      print (x)
    
if __name__ == "__main__":
  main()

```

    



```python
desj open("info_pdo.csv","w+")
```




```python
pwd

```





```python
desj = open("info_pdo.csv","w+")
```


```python
csvdesj = csvreader(desj)
```




```python
desj(head)
```



```python
head?

```

    


```python
import csv
cr = csv.reader(open("info_pdo.csv","rb"))
for row in cr: print(row)

```




```python
import csv
with open('info_pdo.csv', newline='') as csvfile:
    desj = csv.reader(csvfile, delimiter=';', quotechar='|')
    for row in desj:
        print('; '.join(row))
```


    


```python
import csv
desj = open("info_pdo.csv","w+")
desjCSV = csv.reader(desj)
```


```python
import pandas as pd
df1 = pd.read_csv("info_pdo.csv")
```


# presidental debate
```python
```python
!pip install tweepy
```

# 1. Authenticate to Twitter


```python
# Import tweepy to work with the twitter API
import tweepy as tw

# Import numpy and pandas to work with dataframes
import numpy as np
import pandas as pd

# Import seaborn and matplotlib for viz
from matplotlib import pyplot as plt
```


```python
consumer_key = ''
consumer_secret = ''
access_token = ''
access_token_secret = ''
```


```python
# Authenticate
auth = tw.OAuthHandler(consumer_key, consumer_secret)
# Set Tokens
auth.set_access_token(access_token, access_token_secret)
# Instantiate API
api = tw.API(auth, wait_on_rate_limit=True)
```

# 2. Get Tweets


```python
hashtag = "#presidentialdebate"
query = tw.Cursor(api.search, q=hashtag).items(1000)
tweets = [{'Tweet':tweet.text, 'Timestamp':tweet.created_at} for tweet in query]
print(tweets)
```


```python
df = pd.DataFrame.from_dict(tweets)
df.head()
```


```python
trump_handle = ['DonaldTrump', 'Donald Trump', 'Donald', 'Trump', 'Trump\'s']
biden_handle = ['JoeBiden', 'Joe Biden', 'Joe', 'Biden', 'Biden\'s']
```


```python
def identify_subject(tweet, refs):
    flag = 0 
    for ref in refs:
        if tweet.find(ref) != -1:
            flag = 1
    return flag

df['Trump'] = df['Tweet'].apply(lambda x: identify_subject(x, trump_handle)) 
df['Biden'] = df['Tweet'].apply(lambda x: identify_subject(x, biden_handle))
df.head(10)
```

# 3. Preprocess


```python
# Import stopwords
import nltk
from nltk.corpus import stopwords

# Import textblob
from textblob import Word, TextBlob
```


```python
nltk.download('stopwords')
nltk.download('wordnet')
stop_words = stopwords.words('english')
custom_stopwords = ['RT', '#PresidentialDebate']
```


```python
def preprocess_tweets(tweet, custom_stopwords):
    processed_tweet = tweet
    processed_tweet.replace('[^\w\s]', '')
    processed_tweet = " ".join(word for word in processed_tweet.split() if word not in stop_words)
    processed_tweet = " ".join(word for word in processed_tweet.split() if word not in custom_stopwords)
    processed_tweet = " ".join(Word(word).lemmatize() for word in processed_tweet.split())
    return(processed_tweet)

df['Processed Tweet'] = df['Tweet'].apply(lambda x: preprocess_tweets(x, custom_stopwords))
df.head()
```


```python
print('Base review\n', df['Tweet'][0])
print('\n------------------------------------\n')
print('Cleaned and lemmatized review\n', df['Processed Tweet'][0])
```

# 4. Calculate Sentiment


```python
# Calculate polarity
df['polarity'] = df['Processed Tweet'].apply(lambda x: TextBlob(x).sentiment[0])
df['subjectivity'] = df['Processed Tweet'].apply(lambda x: TextBlob(x).sentiment[1])
df[['Processed Tweet', 'Biden', 'Trump', 'polarity', 'subjectivity']].head()
```


```python
display(df[df['Trump']==1][['Trump','polarity','subjectivity']].groupby('Trump').agg([np.mean, np.max, np.min, np.median]))
df[df['Biden']==1][['Biden','polarity','subjectivity']].groupby('Biden').agg([np.mean, np.max, np.min, np.median])
```

## 5. Visualise


```python
biden = df[df['Biden']==1][['Timestamp', 'polarity']]
biden = biden.sort_values(by='Timestamp', ascending=True)
biden['MA Polarity'] = biden.polarity.rolling(10, min_periods=3).mean()

trump = df[df['Trump']==1][['Timestamp', 'polarity']]
trump = trump.sort_values(by='Timestamp', ascending=True)
trump['MA Polarity'] = trump.polarity.rolling(10, min_periods=3).mean()
```


```python
trump.head()
```


```python
repub = 'red'
demo = 'blue'
fig, axes = plt.subplots(2, 1, figsize=(13, 10))

axes[0].plot(biden['Timestamp'], biden['MA Polarity'])
axes[0].set_title("\n".join(["Biden Polarity"]))
axes[1].plot(trump['Timestamp'], trump['MA Polarity'], color='red')
axes[1].set_title("\n".join(["Trump Polarity"]))

fig.suptitle("\n".join(["Presidential Debate Analysis"]), y=0.98)

plt.show()
```


```python

```



```python

```
