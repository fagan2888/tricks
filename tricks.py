# Request data
response = requests.get(url)
data = response.json()

# Pandas to datetime
df.date = pd.to_datetime(df.date, unit='ms')

# List comprehension if/else
[i if i%2 == 0 else 'o' for i in range(10)] # [0, 'o', 2, 'o', 4, 'o', 6, 'o', 8, 'o']
