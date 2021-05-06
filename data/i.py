import pandas as pd
import requests
pd.set_option('display.max_columns', None)
r = requests.get('https://api.bonsai.uno/activities/',
                 params={'lim': 5, "sort": "label"})
print(r.json())
