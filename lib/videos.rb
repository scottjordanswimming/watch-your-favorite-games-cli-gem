# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'current_games/version'
require 'json'
require 'games'
require 'api'

class Videos
  attr_accessor :name, :store_videos

  @@videos = []

  # def initialize(name = nil, _id = nil)
  #   @name = name
  #   @store_videos = store_videos
  # end

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
