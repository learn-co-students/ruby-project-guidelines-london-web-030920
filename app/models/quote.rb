class Quote < ActiveRecord::Base

    belongs_to :movie
    belongs_to :character

    def self.find_movie(quote)
      Movie.all.find {|m| m.quotes.find{|q| q.line == quote}}
    end

end