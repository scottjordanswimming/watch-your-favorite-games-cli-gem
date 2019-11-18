# frozen_string_literal: true

require 'zerp/version'
require 'api'
require 'game'
require 'players'
require 'pry'

class Cli
  def first_prompt
    # here too
    call_api = Api.new
    call_api.api_top_games
    # chain Game.all.each and remove the get_games variable
    get_games = Game.all
    puts ' '
    get_games.each { |games| puts games.name }
    puts ' '
    puts "Welcome! Above is a list of today's most popular games. Type a number 1 - 25, then press enter to get a URL where you can watch that game live."

    get_user_input = gets.chomp
    user_input = get_user_input.to_i

    if user_input.between?(1, 25)
      game_list = Game.all
      game_selection = game_list[user_input - 1]
      game_id = game_selection.id
      get_name = game_selection.name
      game_name = get_name[3..-1]

      call_api.api_players(game_id)
      all_players = Player.all
      # binding.pry
      player = all_players[0]
      puts ' '
      puts "We opened a live game of #{game_name} in your browser at this URL: https://www.twitch.tv/#{player.name} - This streamer's name is #{player.name}."
      puts ' '
      puts 'You have 2 options:'

      puts "1 - Watch #{player.name}'s most popuar videos. (Type 1 then press enter on your keyboard)."
      puts '2 - Exit. (Type 2 then press enter on your keyboard).'

      user_prompt = gets.chomp
      user_response = user_prompt.to_i

      if user_response == 1
        puts ' '
        player.get_videos.each { |video| puts video.urls }
        #  binding.pry
        puts ' '
        puts "Above is a list of #{player.name}'s most watched videos. Copy and paste them in your browser to watch."
        puts ' '

      # elsif user_response == 1
      #   step_1 = Cli.new
      #   step_1.first_prompt
      #   step_1.second_prompt
      #   step_1.third_prompt
      elsif user_response == 2
        exit!
      else
        puts ' '
        puts "Sorry, that wasn't a valid entry, please try again."
        puts ' '
        step_1 = Cli.new
        step_1.third_prompt
    end
end
end
  end
