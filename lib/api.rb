require 'net/http'
require 'uri'
require "current_games/version"
require 'json'



module Api

$game_id = []
$game_name = []

  class Top_Thirty

# @@game_id = []
#
#     def self.game_id
#       @@game_id
#     end

    def api_call

      uri = URI.parse("https://api.twitch.tv/helix/games/top?first=32")
      request = Net::HTTP::Get.new(uri)
      request["Client-Id"] = "212gsg4xr17yp12of3kmw7sha2f121"

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
        end

        a = response.body
        b = JSON.parse(a)
        c = b["data"]
        games = []
        ids = []

        d = c.each_with_index {|hash,i| games << "#{i}. " + hash["name"]}
        e = c.each_with_index {|hash,i| ids << hash["id"]}

        puts games
        puts "Welcome! Here is a list of today's most popular games. Enter a number 0 - 30 to get a URL where you can watch that game live."

        f = gets.chomp
        g = f.to_i
        h = ids[g]

      $game_id << h
      $game_name << games[g]

      end
    end

class Top_Player

#def game_id
#  Top_Thiry.game_id
#end

  def api_call

x = $game_id[0]
y = $game_name[0]
uri = URI.parse("https://api.twitch.tv/helix/streams?game_id=#{x}&first=1")
request = Net::HTTP::Get.new(uri)
request["Client-Id"] = "212gsg4xr17yp12of3kmw7sha2f121"

req_options = {
use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
http.request(request)
end
a = response.body

b = JSON.parse(a)

 c = b["data"]
 d = c[0]
 e = d["user_name"]

puts "Copy and paste this URL into your browser to watch a live game of #{y}: https://www.twitch.tv/#{e}"


end

end



end
