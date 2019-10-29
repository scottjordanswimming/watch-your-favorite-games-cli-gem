require 'net/http'
require 'uri'
require "current_games/version"
require 'json'
require 'cli'

class Games

    @games = ["nil"]
    @ids = []

    #attr_accessor :store_games

    def initialize

    end

    def self.store_games

      a = Api.new
      b = a.api_top_games

            c = JSON.parse(b)
            d = c["data"]

    # pushes all games and ids into separate arrays with index
            e = d.each_with_index {|hash,i| @games << "#{i + 1}. " + hash["name"]}
            f = d.each_with_index {|hash,i| @ids << hash["id"]}

      end

      def self.all
        @games
      end

def self.ids
  @ids
end


end
