# frozen_string_literal: true

class Videos
  @@all = []

  attr_accessor :urls, :player_instance

  def initialize(urls, player_instance)
    @urls = urls
    @player_instance = player_instance
    @@all << self
  end

  def self.all
    @@all
  end
end
