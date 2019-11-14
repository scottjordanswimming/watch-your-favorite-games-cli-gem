# frozen_string_literal: true

require 'net/http'
require 'uri'
require_relative 'current_games/version'
require 'json'
require_relative 'games'
require_relative 'cli'
require_relative 'videos'

class Api
  def api_top_games
    @top_games = []
    @game_ids = []
    uri = URI.parse('https://api.twitch.tv/helix/games/top?first=26')
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    data = response.body
    parsed_games = JSON.parse(data)
    data_of_games = parsed_games['data']
    data_of_games.each_with_index { |hash, i| @top_games << "#{i + 1}. " + hash['name'] }
    data_of_games.each_with_index { |hash, _i| @top_games << hash['id'] }

  @top_games
    end

  def api_players
    @player = []
    @videos = []
    games_arr = Games.all
    user_input = Cli.user_selection
    u = user_input[0]
    game_id = games_arr[u]
    uri = URI.parse("https://api.twitch.tv/helix/streams?game_id=#{game_id}&first=1")
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    data = response.body
    parsed_players = JSON.parse(data)
    data_of_players = parsed_players['data']
    player = data_of_players[0]
    player_name = player['user_name']
    player_id = player['user_id']
    @player << player_name
    @player << player_id

    uri = URI.parse("https://api.twitch.tv/helix/videos?user_id=#{player_id}&sort=views&first=5")
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    data = response.body
    parsed_videos = JSON.parse(data)
    data_of_videos = parsed_videos['data']
    data_of_videos.each { |videos| @videos << videos['url'] }
    @player
    end


end
