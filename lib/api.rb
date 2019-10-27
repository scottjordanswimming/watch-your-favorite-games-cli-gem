require 'net/http'
require 'uri'

class API

uri = URI.parse("https://api.twitch.tv/helix/games/top?first=30’")
request = Net::HTTP::Get.new(uri)
request["Client-Id"] = "212gsg4xr17yp12of3kmw7sha2f121"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
end
