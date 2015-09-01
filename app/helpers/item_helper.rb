def get_items
  url = full_url("/api/lol/static-data/#{region}/v1.2/item",
                  "version=#{item_dd_version}",
                  "itemListData=all")
  data = get(url)
  __format_items(data)
end

def get_item(id)
  url = full_url("/api/lol/static-data/na/v1.2/item/#{id}",
                  "version=#{item_dd_version}",
                  "itemData=all")
  data = get(url)
end

def __format_items(data)
  data = data["data"].map {|key, value| value}
  data.sort! { |a, b| a["name"] <=> b["name"] }
end


# Temp function til API working correctly
def item_availability
  data = get("http://ddragon.leagueoflegends.com/cdn/5.14.1/data/en_US/map.json")
  data = data["data"]
  data = {TT: data["10"]["UnpurchasableItemList"], SR: data["11"]["UnpurchasableItemList"]}
end