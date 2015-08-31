# one-shot


GOALS
Ask user for map, game type, set name




DONE
Setup Sinatra application that can query League API for item data.







item_sets:
  set_name
  user_id (belongs_to a User)
  champion
  map
  game_type

categories_sets: (join table)
  set_id
  category_id

item_categories:
  name

categories_items: (join table)
  category_id
  item_id

items:
  id








OLD
Overarching goal of this app is as follows:
Ask the user for a user champion
Ask the user for a target champion/item build
Create an item build for user champion that should (if possible) 1-shot the target champion.