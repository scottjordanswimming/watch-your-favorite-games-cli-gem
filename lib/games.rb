# frozen_string_literal: true

require 'net/http'
require 'uri'
require_relative 'current_games/version'
require 'json'
require_relative 'cli'
require_relative 'api'

class Games
  @@all = []

  attr_accessor :name, :id, :player

  def initialize
    @list = []
    @id = id
    @player = []
  end

  def add_games
    @list << Api.api_top_games
  end

  def self.all
    @@all
  end

  def self.ids
    @@ids
  end
end

# def self.store_games
#   api_call = Api.new
#   top_games = api_call.api_top_games
#
#   parsed_games = JSON.parse(top_games)
#   data_of_games = parsed_games['data']
#
#   # pushes all games and ids into separate arrays with index
#   e = data_of_games.each_with_index { |hash, i| @games << "#{i + 1}. " + hash['name'] }
#   f = data_of_games.each_with_index { |hash, _i| @@ids << hash['id'] }
#   end
