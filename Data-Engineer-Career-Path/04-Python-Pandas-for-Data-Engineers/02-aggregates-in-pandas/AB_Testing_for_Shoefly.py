import pandas as pd

ad_clicks = pd.read_csv('ad_clicks.csv')

print(ad_clicks.head())

views_per_utm_source = ad_clicks.groupby('utm_source').user_id.count().reset_index()
print(views_per_utm_source)

ad_clicks['is_click'] = ~ad_clicks.ad_click_timestamp.isnull()

print(ad_clicks.head())

clicks_by_source = ad_clicks.groupby(['utm_source', 'is_click']).user_id.count().reset_index()
clicks_pivot = clicks_by_source.pivot(
  columns = 'is_click',
  index = 'utm_source',
  values = 'user_id'
).reset_index()
print(clicks_pivot)

clicks_pivot['percent_clicked'] = clicks_pivot[True]/(clicks_pivot[True]+clicks_pivot[False])

print(clicks_pivot)

experimental_group = ad_clicks.groupby('experimental_group').user_id.count().reset_index()
print(experimental_group)

experimental_group = ad_clicks.groupby(['experimental_group', 'is_click']).user_id.count().reset_index()
print(experimental_group)

experimental_group_pivot = experimental_group.pivot(
  columns = 'is_click',
  index = 'experimental_group',
  values = 'user_id'
).reset_index()
print(experimental_group_pivot)

a_clicks = ad_clicks[
   ad_clicks.experimental_group
   == 'A']
b_clicks = ad_clicks[
   ad_clicks.experimental_group
   == 'B']

a_clicks_groupby_day = a_clicks.groupby(['is_click', 'day']).user_id.count().reset_index()

a_clicks_pivot = a_clicks_groupby_day.pivot(
  columns = "day",
  index = 'is_click',
  values = 'user_id'
).reset_index()

print(a_clicks_pivot)

b_clicks_groupby_day = b_clicks.groupby(['is_click', 'day']).user_id.count().reset_index()

b_clicks_pivot = b_clicks_groupby_day.pivot(
  columns = "day",
  index = 'is_click',
  values = 'user_id'
).reset_index()

print(b_clicks_pivot)