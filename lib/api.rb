require 'net/http'
require 'uri'
require "current_games/version"


module Api
  class Body

    def api_call

uri = URI.parse("https://api.twitch.tv/helix/games/top?first=30")
request = Net::HTTP::Get.new(uri)
request["Client-Id"] = "212gsg4xr17yp12of3kmw7sha2f121"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
http.request(request)
end
puts response.body


end
end
end
