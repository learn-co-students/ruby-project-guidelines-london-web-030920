class Movie < ActiveRecord::Base

    has_many :quotes
    has_many :characters, through: :quotes

    def all_movies
        Movie.all
    end

end