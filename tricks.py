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

# Pandas replace
df.disease = df_clean.disease.replace(to_replace="control", value='healthy')

# Pandas lambda function
df.tissue  = df.tissue.apply(lambda x: x.lower())

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
