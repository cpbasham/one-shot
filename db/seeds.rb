user = User.create(login: "getajob92", summoner: "basham", password: "yadayada")
user.item_sets.create(name: "Test Set", champion: "Garen", map: "Summoner's Rift")
set = user.item_sets.first
set.item_categories.create(name: "Row 1")