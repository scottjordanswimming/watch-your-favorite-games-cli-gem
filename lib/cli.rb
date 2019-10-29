require 'net/http'
require 'uri'
require "current_games/version"
require 'json'
require 'games'
require 'api'

class Cli

  attr_accessor :games, :store_games

@@game_id = ["nil"]
@@game_name = ["nil"]

def initialize
  @store_games = store_games

end

# @@game_id = []
#
#     def self.game_id
#       @@game_id
#     end
def first_prompt


# shows all indexed games and prompts user
        Games.store_games
        puts Games.all
        puts " "
        puts "Welcome! Above is a list of today's most popular games. Type a number 1 - 25, then press enter to get a URL where you can watch that game live."
# gets user input, turns string to integer
        f = gets.chomp
        g = f.to_i
        h = Games.ids[g]
# pushes user selection into game id array and game name array
      @@game_id << h
      @@game_name << Games.all[g]

    end

  def second_prompt
    a = Api.api_players
    b = JSON.parse(a)
    c = b["data"]
    d = c[0]
    e = d["user_name"]
    f = @@game_name[1]

# provides user with a link of their game
puts d
    system("open", "https://www.twitch.tv/#{e}")
    puts " "
    puts "We opened a live game of #{f} in your browser at this URL: https://www.twitch.tv/#{e} - This streamer's name is #{e}."
    puts " "

  end

end
