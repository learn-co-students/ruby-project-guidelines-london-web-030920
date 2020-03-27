class Movie < ActiveRecord::Base

    has_many :quotes
    has_many :characters, through: :quotes

    def self.newest_movie
        Movie.all.max_by{|movie| movie.year }
    end

end