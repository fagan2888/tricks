# List comprehension if/else
[i if i%2 == 0 else 'o' for i in range(10)] # [0, 'o', 2, 'o', 4, 'o', 6, 'o', 8, 'o']

# Pickle save
pickle.dump(df, open("df.pkl","wb"))

# Pickle load
df = pickle.load(open("df.pkl","rb"))

# Pickling in py3/py2
with open('df.pkl3', 'rb') as handle: # Open in py3
    df = pickle.load(handle)
pickle.dump(df, open("df.pkl2", "wb"), protocol=2) # Save for py2

# Request data
response = requests.get(url)
data = response.json()

# Pandas settings
options = {
    'display': {
        'max_columns'   : 10,
        'max_colwidth'  : 25,
        'max_rows'      : 14,
        'max_seq_items' : 50,
        'precision'     : 4,
    }
}
for category, option in options.items():
    for op, value in option.items():
        pd.set_option(f'{category}.{op}', value)

# Pandas reading in data
cols = ['col1', 'col2', 'col3']
df = pd.read_csv("data.csv", usecols=[0, 1, 2], names=cols)

# Pandas simulated timeseries data
import pandas.util.testing as tm
tm.N, tm.K = 15, 3  # Number of rows/columns
df = tm.makeTimeDataFrame(freq='M')

# Pandas load data from your clipboard
df = pd.read_clipboard()

# Pandas to datetime
df.date = pd.to_datetime(df.date, unit='ms')

# Pandas subset columns
df = df[["col1", "col2"]]
df = df[[df.columns[1:3]]]

# Pandas colbind
df = pd.concat([df1, df2], axis=1)

# Pandas rowbind
df = pd.concat([df1, df2])

# Pandas rowbind, delete duplicates, replace missing vals with NaN
df = pd.DataFrame({**df1.to_dict(), **df2.to_dict()})

# Pandas multi-conditional slicing
df = df[('col1' > 5) | ('col2' == 3)]
df = df[('col1' > 5) & ('col2' == 3)]

# Pandas sort index in place
df.sort_index(inplace=True)

# Drop cols with all 0s
df = df.loc[:, (df != 0).any(axis=0)]

# Drop a feature
df = df.drop('feature', axis=1)

# Pandas replace
df.disease = df_clean.disease.replace(to_replace="control", value='healthy')

# Pandas lambda function
df.tissue = df.tissue.apply(lambda x: x.lower())

# Pandas Apply function
def multiply(x): return x * 2
df.height = df.height.apply(multiply)

# Pandas rename column
df = df.rename(columns = {df.columns[2]:'col'}, inplace=True)

# Persistent data scraping/collection
def refresh():
    try:
        data.update()
    except Exception as e:
        pass     
schedule.every(30).minutes.do(refresh)
while True:
    schedule.run_pending()
    time.sleep(1)

# Iterate through directories    
for fn in os.listdir(pathtodir):
    with open(os.path.join(pathtodir, fn) as infile:
                  
# Sort dictionary by value
c = sorted(c.items(), key=lambda x: -x[1])
              
# Figure control
fig, ax = pyplot.subplots(figsize=(14,8))
sns.barplot(x="x", y="y", hue="col", data=df, ax=ax)
