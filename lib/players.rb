# frozen_string_literal: true

class Player
  @@all = []

  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
    @@all << self
  end

  def get_videos
    Videos.all.select { |videos| videos.player_instance = self }
  end

  def self.all
    @@all
  end
end
