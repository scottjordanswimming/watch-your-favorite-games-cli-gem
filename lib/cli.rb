# frozen_string_literal: true

class Cli
  def first_prompt
    Api.new.api_top_games
    puts ' '
    Game.all.each_with_index { |games, i| puts "#{i + 1}. " + games.name }
    puts ' '
    puts "Welcome! Above is a list of today's most popular games. Type a number 1 - 25, then press enter to get a URL where you can watch that game live."
get_user_input
end

def get_user_input

    user_input = gets.chomp.to_i

    if user_input < 0 || user_input > 25
      puts ' '
      puts "Sorry, that wasn't a valid entry, please try again."
      puts ' '
      get_user_input

    else
      game_selection = Game.all[user_input - 1]

      Api.new.api_players(game_selection.id)
      all_players = Player.all
      @player = all_players[-1]
      puts ' '
      puts "We opened a live game of #{game_selection.name} in your browser at this URL: https://www.twitch.tv/#{@player.name} - This streamer's name is #{@player.name}."
      puts ' '
      puts 'You have 2 options:'
      puts "1 - Watch #{@player.name}'s most popuar videos. (Type 1 then press enter on your keyboard)."
      puts '2 - Exit. (Type 2 then press enter on your keyboard).'

    end
videos
  end

def videos
      user_response = gets.chomp.to_i

      if user_response == 1
        puts ' '
        @player.get_videos.each { |video| puts video.urls }
        puts ' '
        puts "Above is a list of #{@player.name}'s most watched videos. Copy and paste them in your browser to watch."
        puts ' '
        puts "What would you like to do next?"
        puts "1. (Type 1 to exit)"
        puts " "
      else
        puts ' '
        puts "Sorry, that wasn't a valid entry, please try again."
        puts ' '
        videos
    end
    last_prompt
  end

    def last_prompt
      user_response = gets.chomp.to_i

      if user_response == 1
        exit!
      else
          puts ' '
          puts "Sorry, that wasn't a valid entry, please try again."
          puts "1. (Type 1 to exit)"
          puts ' '
          last_prompt
        end
    end
end
