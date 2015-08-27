# ONLINE = true
ONLINE = false

get '/items/json' do
  @items = get_items()
  @items.to_s
end




get '/' do
  redirect '/items'
end

get '/items' do
  @items = get_items
  erb :'items/index'
end

get '/items/:id' do
  @item = get_item(params[:id])
  erb :'items/show'
end

get '/images/items' do
  @items = get_items()
  erb :'images/items/index'
end

get '/images/items/:id' do
  @item = get_item(params[:id])
  erb :'images/items/show'
end

get '/item_sets' do
  erb :'item_sets/show'
end



get '/champions' do
  @champions = APICommunicator.items
end