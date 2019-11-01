# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'current_games/version'
require 'json'
require 'api'
require 'players'
require 'games'

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

  def second_prompt
    Players.store_players
    list_players = Players.all
    first_player = list_players[0]
    game_name = @@game_name[1]
    fixed_name = game_name[3...]

    system('open', "https://www.twitch.tv/#{first_player}")
    puts ' '
    puts "We opened a live game of #{fixed_name} in your browser at this URL: https://www.twitch.tv/#{first_player} - This streamer's name is #{first_player}."
    puts ' '

  end

  def third_prompt
    puts "Would you like to see a list of funny clips of #{first_player} playing #{fixed_name}? (Y/N). Type Y for Yes, or N for No."

prompt_user = gets.chomp
user_response = prompt_user.to_s

    if user_response == "N" || "n"
      exit!
    else
    #to_integer = f.to_i
  end

  end

  def self.user_selection
    @@user_selection
  end





end
