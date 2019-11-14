# frozen_string_literal: true

require 'net/http'
require 'uri'
require_relative 'current_games/version'
require 'json'
require_relative 'api'
require_relative 'player'
require_relative 'games'
require_relative 'videos'

class Cli
  attr_accessor :games, :store_games, :store_players, :players

  @@user_selection = []
  @@game_name = []

  def first_prompt

    game_list = Games.all[0]
    puts ' '
    puts ' '
    puts game_list[1..25]
    puts ' '
    puts "Welcome! Above is a list of today's most popular games. Type a number 1 - 25, then press enter to get a URL where you can watch that game live."

    get_user_input = gets.chomp
    user_input = get_user_input.to_i

    if user_input.between?(1,25)

    @@user_selection << g
    @@game_name << Games.all[g]
    a = Players.new

    z = Games.all
    x = z[0]
    a.add_player(x)

  else
    puts " "
    puts "Sorry, that's not a valid entry. Please try again"
    puts " "
    step_1 = Cli.new
    step_1.first_prompt
    step_1.second_prompt
    step_1.third_prompt
  end

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
    get_game = @@game_name
    game_name = get_game[0]
    get_player = Api.api_players
    player_name = a[0]

    system('open', "https://www.twitch.tv/#{player_name}")
    puts ' '
    puts "We opened a live game of #{game_name} in your browser at this URL: https://www.twitch.tv/#{player_name} - This streamer's name is #{player_name}."
    puts ' '
  end

  def third_prompt
    a = get_game
    b = get_player
    puts "You have 2 options:"
    #puts "1 - Go back to the main menu. (Type 1 then press enter on your keyboard)."
    puts "1 - Watch #{b}'s most popuar videos. (Type 1 then press enter on your keyboard)."
    puts "2 - Exit. (Type 2 then press enter on your keyboard)."

user_prompt = gets.chomp
user_response = user_prompt.to_i

    if user_response == 1
      Videos.store_videos
      list_videos = Videos.all
      puts " "
      puts list_videos
      puts " "
      puts "Above is a list of #{b}'s most watched videos. Copy and paste them in your browser to watch."
      puts " "

    # elsif user_response == 1
    #   step_1 = Cli.new
    #   step_1.first_prompt
    #   step_1.second_prompt
    #   step_1.third_prompt
    elsif user_response == 2
      exit!
    else
      puts " "
      puts "Sorry, that wasn't a valid entry, please try again."
      puts " "
      step_1 = Cli.new
      step_1.third_prompt
  end
  end

  def self.user_selection
    @@user_selection
  end

end
