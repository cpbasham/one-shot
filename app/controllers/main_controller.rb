get '/' do
  redirect '/items'
end

get '/items' do
  @items = get_items
  @items.sort! { |a, b| a["name"] <=> b["name"] }
  @items.each do |item|
    image_url = "#{ITEM_IMAGE_LINK}/#{item["image"]["full"]}"
    open("test-files/item-images/#{item["image"]["full"]}", 'wb') do |file|
      file << open(image_url).read
    end
  end
  "Finished!"
  # erb :'items/index'
end




get '/champions' do
  @champions = APICommunicator.items
end