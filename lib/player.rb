class Player < ActiveRecord::Base
    has_many :contracts
    has_many :teams, through: :contracts
    
# most valuable player

# longest injury
# most contracts at one team
# most contracts
# current team
# current position
# number of teams played for 
# injuries after date
# current contract

end