# frozen_string_literal: true

require 'net/http'
require 'uri'
require_relative 'current_games/version'
require 'json'
require_relative 'games'
require_relative 'api'

class Player

  @@all = []

  attr_accessor :name, :id, :videos

  def initialize
    @name = name
    @id = id
    @videos = videos
    @@all << Api.api_players
  end

  def add_player(game)
    game.player = self
  end

  def self.all
    @@all
  end

  def self.ids
    @@all
  end
end
