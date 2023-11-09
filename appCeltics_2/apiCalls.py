# %%

# use_python("/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10", required = T)
# Hit Run at top to switch to running .py instead of .r
from nba_api.stats.endpoints import playercareerstats
from nba_api.stats.endpoints import leagueleaders
from nba_api.stats import endpoints

import numpy as np
import pandas as pd

# Nikola Jokić
career = playercareerstats.PlayerCareerStats(player_id='203999') 
# pandas data frames (optional: pip install pandas)
test_pd = career.get_data_frames()[0]
# json
test_json = career.get_json()
# dictionary
test_dict = career.get_dict()

# Here we access the leagueleaders module through endpoints & assign the class to "data"
data = endpoints.leagueleaders.LeagueLeaders() 
# Our "data" variable now has built in functions such as creating a dataframe for our data
df = data.league_leaders.get_data_frame()


# %% 
#columns_list = df.columns.tolist()
#print(columns_list)
# %%
#df.head()