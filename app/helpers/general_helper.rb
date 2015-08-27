API_UL_HEAD = "https://global.api.pvp.net"
IMAGE_LINK = "http://ddragon.leagueoflegends.com/cdn/5.2.1/img"
SPRITE_LINK = "http://ddragon.leagueoflegends.com/cdn/5.2.1/img/sprite"

#GENERAL
ALPHANUMERIC = [*"0".."9"] + [*"A".."Z"]
def normalized_string(s)
  chars = s.downcase.chars
  chars.select! { |char| ALPHANUMERIC.include?(char) }
  chars.join("")
end

def normalized_match?(s1, s2)
  normalized_string(s1) == normalized_string(s2)
end


#URLS
def full_url(url, *params)
  url += "?"
  params.each {|param| url += param + "&"}
  "#{API_UL_HEAD}" + url + "api_key=#{API_KEY}"
end

def get(url)
  uri = URI(url)
  data = open(uri).read
  JSON.parse(data)
end


#ITEMS
ITEM_IMAGE_LINK = IMAGE_LINK + "/item"
def get_items
  if ONLINE
    url = full_url("/api/lol/static-data/na/v1.2/item", "itemListData=all")
    data = get(url)
  else
    data = File.open("test-files/items.json").read
    data = JSON.parse(data)
  end
  format_items(data)
end

def format_items(data)
  data = data["data"].map {|key, value| value}
  data.sort! { |a, b| a["name"] <=> b["name"] }
end

def get_item(id)
  if ONLINE
    url = full_url("/api/lol/static-data/na/v1.2/item/#{id}", "itemData=all")
    data = get(url)
  else
    get_items.find{|item| item["id"].to_s == id}
  end
end


#CHAMPIONS
def champions
  url = full_url("api/lol/static-data/na/v1.2/champion")
  data = get(url)
  data["data"].map do |key, value|
    value
  end
end