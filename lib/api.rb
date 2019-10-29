require 'net/http'
require 'uri'
require "current_games/version"
require 'json'



module Api
# global arrays to hold the eventual game ID (to be inserted into second API call) and game name (to be inserted into final text to user).
$game_id = []
$game_name = []

  class Top_Thirty

# @@game_id = []
#
#     def self.game_id
#       @@game_id
#     end

    def api_call
#API call to twitch.com which pulls top 30 most viewed current games
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

# pushes all games and ids into separate arrays with index
        d = c.each_with_index {|hash,i| games << "#{i}. " + hash["name"]}
        e = c.each_with_index {|hash,i| ids << hash["id"]}
# shows all indexed games and prompts user
        puts games
        puts "Welcome! Above is a list of today's most popular games. Type a number 0 - 30, then press enter, to get a URL where you can watch that game live."
# gets user input, turns string to integer
        f = gets.chomp
        g = f.to_i
        h = ids[g]
# pushes user selection into game id array and game name array
      $game_id << h
      $game_name << games[g]

      end
    end

class Top_Player

#def game_id
#  Top_Thiry.game_id
#end

  def api_call
# takes user selection game id and inserts into API call. API call returns most viewed game being played
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

# parse API response to return only user name of twitch streamer
    a = response.body
    b = JSON.parse(a)
    c = b["data"]
    d = c[0]
    e = d["user_name"]

# provides user with a link of their game
    puts "Copy and paste this URL into your browser to watch a live game of #{y}: https://www.twitch.tv/#{e}"

  end

end

end
