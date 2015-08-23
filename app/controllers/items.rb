get '/' do
  redirect '/items'
end

get '/items' do
  @items = get_items
  @items.sort! { |a, b| a["name"] <=> b["name"] }
  erb :'items/index'
end

# get '/items:name' do
#   name = params[:name]
#   @item = items.find {|item| normalized_match?(item["name"], name)}
#   erb :'items/show'
# end

# get '/items/:name' do
#   @item = item(params[:name])
#   # @item.to_s

#   @item2 = items.find {|item| item["name"] == @item["name"]}
#   (@item.to_s == @item2.to_s).to_s
# end







get '/champions' do
  @champions = APICommunicator.items
end