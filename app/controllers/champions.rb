get '/' do
  erb :index
end

get '/champions' do
  # "RAWR"
  APIGetters.champions
end

# get '/:champion' do
#   champion_name = params[:champion]
#   "HI!"
#   # champions = URI::HTTP.open(APIGetters.get_champ_by_name(champion_name: champion_name))
#   # champions = JSON.parse(champions)
#   # champions.to_s
#   # champions = JSON.parse(champions)
#   # erb :champion
# end