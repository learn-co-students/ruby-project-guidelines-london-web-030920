class Character < ActiveRecord::Base

    has_many :quotes
    has_many :movies, through: :quotes

    def self.delete_quote_from_name(quote)
        found_quote = Quote.find_by(line: quote)
        Quote.all.delete(found_quote)
    end

end