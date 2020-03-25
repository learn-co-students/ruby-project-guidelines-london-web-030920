class Character < ActiveRecord::Base

    has_many :quotes
    has_many :movies, through: :quotes

end