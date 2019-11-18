# frozen_string_literal: true

class Game
  @@all = []

  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.ids
    @@ids
  end
end
