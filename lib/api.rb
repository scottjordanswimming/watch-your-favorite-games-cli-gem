# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'zerp/version'
require 'json'
require 'cli'
require 'game'
require 'players'
require 'videos'

class Api
  def api_top_games

    uri = URI.parse('https://api.twitch.tv/helix/games/top?first=25')
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
    data_of_games.each_with_index { |hash, i| Game.new("#{i + 1}. " + hash['name'], + hash['id']) }
    end

  def api_players(game_id)
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
    new_player = Player.new(player_name, player_id)
    system('open', "https://www.twitch.tv/#{new_player.name}")

    x = Player.all
    player_id = x[1]

    uri = URI.parse("https://api.twitch.tv/helix/videos?user_id=#{new_player.id}&sort=views&first=5")
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
    #  binding.pry
    data_of_videos.each { |video| Videos.new(video['url'], new_player) }
        # new_player.add_videos(data_of_videos)
      end
  end
