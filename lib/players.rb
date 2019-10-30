require 'net/http'
require 'uri'
require "current_games/version"
require 'json'




$game_id = []
$game_name = []


class Players

#def game_id
#  Top_Thiry.game_id
#end

  def user_name

# parse API response to return only user name of twitch streamer
    a = response.body
    b = JSON.parse(a)
    c = b["data"]
    d = c[0]
    e = d["user_name"]

  end

end
