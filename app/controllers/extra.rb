# get '/_populate_images' do
#   @items = format_items(get_items)
#   @items.each do |item|
#     image_url = "#{ITEM_IMAGE_LINK}/#{item["image"]["full"]}"
#     begin
#       img = open(image_url).read
#       open("test-files/item-images/#{item["image"]["full"]}", 'wb') do |file|
#         file << img
#       end
#     rescue
#       next;
#     end
#   end
#   "Image files generated!"
# end

# get '/_populate_item_info' do
#   ONLINE = true;
#   @items = get_items
#   ONLINE = false;
#   File.open("test-files/items.json", "wb") do |f|
#     f.write(@items.to_json)
#   end
#   "Item info generated!"
# end
