# frozen_string_literal: true

require 'net/http'
require 'uri'
require_relative 'current_games/version'
require 'json'
require_relative 'games'
require_relative 'api'

class Videos
  attr_accessor :urls, :player

  @@all = []

  def initialize
    @urls = urls
    @player = player
  end

  def self.store_videos
    a = Api.new
    b = a.api_videos
    c = JSON.parse(b)
    d = c['data']
    d.each { |videos| @@videos << videos['url'] }
    @@videos
end

  def self.all
    @@videos
  end
end
