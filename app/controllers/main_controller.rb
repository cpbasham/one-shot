get '/' do
  redirect '/items'
end

get '/items' do
  @items = get_items
  @items.sort! { |a, b| a["name"] <=> b["name"] }
  erb :'items/index'
end




get '/champions' do
  @champions = APICommunicator.items
end