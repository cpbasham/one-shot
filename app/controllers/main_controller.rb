ONLINE = true
# ONLINE = false

get '/items/json/?' do
  @items = get_items()
  # @items.to_s
  @items.join("<br><br>" + "-"*237 + "<br><br>")
end




get '/' do
  redirect '/items'
end

get '/items/?' do
  erb :'items/index', locals: {items: get_items}
end

get '/items/:id/?' do
  erb :'items/show', locals: {item: get_item(params[:id])}
end

get '/images/items/?' do
  erb :'images/items/index', locals: {items: get_items}
end

get '/images/items/:id/?' do
  @item = get_item(params[:id])
  erb :'images/items/show', locals: {item: get_item(params[:id])}
end

get '/item_sets/?' do
  erb :'item_sets/show'
end



get '/champions/?' do
  @champions = APICommunicator.items
end