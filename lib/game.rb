# frozen_string_literal: true

require 'zerp/version'
require 'api'
require 'cli'

class Game
  @@all = []

  attr_accessor :name, :id, :player

  def initialize(name, id)
    @name = name
    @list = []
    @id = id
    @player = player
    @@all << self
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
