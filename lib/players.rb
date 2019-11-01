# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'current_games/version'
require 'json'
require 'games'
require 'api'
require 'pry'

class Players
  attr_accessor :name, :store_players

  @@players = []
  @@player_id = []

  def initialize(name = nil, id = nil)
    @name = name
    @id = id
    @store_players = store_players
  end
  # def game_id
  #  Top_Thiry.game_id
  # end

  def self.store_players
    a = Api.new
    b = a.api_players
    c = JSON.parse(b)
    # binding.pry
    d = c['data']
    e = d[0]
    f = e['user_name']
    g = e['user_id']
    @@players << f
    @@player_id << g
end

  def self.all
    @@players
  end

  def self.ids
    @@player_id
  end
end
