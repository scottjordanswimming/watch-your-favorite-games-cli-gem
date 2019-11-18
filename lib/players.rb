# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'zerp/version'
require 'json'
require 'cli'
require 'game'
require 'api'

class Player
  @@all = []

  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
    @@all << self
  end

  def add_player(game)
    game.player = self
  end

  def get_videos
    Videos.all.select { |videos| videos.player_instance = self }
  end

  # def add_videos(videos)
  #   @videos << videos
  # end

  def self.all
    @@all
  end
end
