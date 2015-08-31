def full_url(url, *params)
  url += "?"
  params.each {|param| url += param + "&"}
  "#{api_ul_head}" + url + "api_key=#{API_KEY}"
end

def get(url)
  uri = URI(url)
  data = open(uri).read
  JSON.parse(data)
end