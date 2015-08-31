def get_champions
  url = full_url("api/lol/static-data/#{region}/v1.2/champion",
                  "version=#{champion_dd_version}",
                  "champData=all")
  data = get(url)
  data["data"].map do |key, value|
    value
  end
end