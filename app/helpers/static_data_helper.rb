def jquery_url
  "//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
end

def jquery_ui_url
  "https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"
end

def api_ul_head
  "https://global.api.pvp.net"
end

def dd_ul_head
  realm_data["cdn"]
end

def realm_data
  @REALM_DATA ||= get(full_url("/api/lol/static-data/#{region}/v1.2/realm"))
end

def region
  @REGION ||= "na"
end

def region=(region)
  @REGION = region
end

def __setup_extra_getters
  # keys = realm_data["n"].keys
  keys = ["item"]

  keys.each do |key|
    define_singleton_method("#{key}_dd_version") do
      realm_data["n"][key]
    end
    define_singleton_method("#{key}_image_head") do
      "#{dd_ul_head}/#{realm_data["n"][key]}/img/#{key}"
    end
    define_singleton_method("#{key}_sprite_head") do
      "#{dd_ul_head}/#{realm_data["n"][key]}/img/sprite"
    end
  end
end