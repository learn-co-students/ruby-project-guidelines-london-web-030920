class Movie < ActiveRecord::Base

    has_many :quotes
    has_many :characters, through: :quotes

end