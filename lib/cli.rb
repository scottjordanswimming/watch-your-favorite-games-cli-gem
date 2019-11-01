# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'current_games/version'
require 'json'
require 'api'
require 'players'
require 'games'
require 'videos'

class Cli
  attr_accessor :games, :store_games, :store_players, :players

  @@user_selection = []
  @@game_name = ['nil']

  def first_prompt
    Games.store_games
    puts Games.all
    puts ' '
    puts "Welcome! Above is a list of today's most popular games. Type a number 1 - 25, then press enter to get a URL where you can watch that game live."

    f = gets.chomp
    g = f.to_i

    @@user_selection << g
    @@game_name << Games.all[g]
  end

  def get_player
        Players.store_players
        list_players = Players.all
        first_player = list_players[0]
        first_player
  end

  def get_game
        game_name = @@game_name[1]
        fixed_name = game_name[3...]
        fixed_name
  end

  def second_prompt

a = get_game
b = get_player


    system('open', "https://www.twitch.tv/#{b}")
    puts ' '
    puts "We opened a live game of #{a} in your browser at this URL: https://www.twitch.tv/#{b} - This streamer's name is #{b}."
    puts ' '

  end

  def third_prompt
    a = get_game
    b = get_player
    puts "You have 3 options:"
    puts "1 - Go back to the main menu. (Type 1 then press enter on your keyboard)"
    puts "2 - Watch #{b}'s most popuar videos. (Type 2 then press enter on your keyboard)"
    puts "3 - Exit. (Press Enter or type 3 then press enter on your keyboard)"


user_prompt = gets.chomp
user_response = user_prompt.to_i

    if user_response == 2
      Videos.store_videos
      list_videos = Videos.all
      puts list_videos

  end

  end

  def self.user_selection
    @@user_selection
  end





end
