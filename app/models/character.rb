class Character < ActiveRecord::Base

    has_many :quotes
    has_many :movies, through: :quotes

    def self.delete_quote_from_name(quote)
        found_quote = Quote.find_by(line: quote)
        Quote.all.delete(found_quote)
    end


    def self.longest_name
        Character.all.max_by{|c| c.name.length }.name
    end

    def self.shortest_name
        Character.all.min_by{|c| c.name.length }.name
    end


    def all_female
        Character.all.select{|c| c.gender == "M"}
    end

end