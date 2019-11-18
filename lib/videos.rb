# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'zerp/version'
require 'json'
require 'cli'
require 'game'
require 'api'

class Videos
  @@all = []

  attr_accessor :urls, :player_instance

  def initialize(urls, player_instance)
    @urls = urls
    @player_instance = player_instance
    @@all << self
  end

  # def add_player(game)
  #   game.player = self
  # end

  # def add_videos(videos)
  #   @videos << videos
  # end

  def self.all
    @@all
  end
end
