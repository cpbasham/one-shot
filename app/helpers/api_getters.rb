module APIGetters

  def self.full_url(url)
    "#{API_UL_HEAD}" + url + "?api_key=#{API_KEY}"
  end

  def self.get(url)
    uri = URI(self.full_url(url))
    Net::HTTP.get_response(uri)
  end

  def self.champions
    # self.full_url("api/lol/static-data/na/v1.2/champion")
    # self.get("api/lol/static-data/na/v1.2/champion")
    open(full_url("api/lol/static-data/na/v1.2/champion"))
    # open(full_url("api/lol/static-data/na/v1.2/champion"))
  end

  def self.get_champion_by_name(args = {})
    champion_name = args.fetch(:champion_name)
    region = args.fetch(:region) { "na" }
    # "#{API_UL_HEAD}/api/lol/static-data/na/v1.2/#{champion_name}?api_key=#{API_KEY}"

  end

end