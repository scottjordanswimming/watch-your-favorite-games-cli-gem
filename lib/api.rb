# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'current_games/version'
require 'json'
require 'games'
require 'cli'
require 'videos'

class Api
  def api_top_games
    # API call to twitch.com which pulls top 30 most viewed current games
    uri = URI.parse('https://api.twitch.tv/helix/games/top?first=26')
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response.body
    end

  def api_players
    # takes user selection game id and inserts into API call. API call returns most viewed game being played
    z = Games.ids
    t = Cli.user_selection
    u = t[0]
    y = z[u]
    uri = URI.parse("https://api.twitch.tv/helix/streams?game_id=#{y}&first=1")
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response.body
    end

  def api_videos
    z = Players.ids
    t = z[0]
    uri = URI.parse("https://api.twitch.tv/helix/videos?user_id=#{t}&sort=views&first=5")
    request = Net::HTTP::Get.new(uri)
    request['Client-Id'] = '212gsg4xr17yp12of3kmw7sha2f121'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response.body
end
end
