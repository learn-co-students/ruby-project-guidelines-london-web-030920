class Player < ActiveRecord::Base
    has_many :contracts
    has_many :teams, through: :contracts
    
# most expensive player
def most_expensive_wage
    highest_wage = Contract.all.max{|contract|contract.wage}
end

def most_expensive_player
    most_expensive = Player.all.find{|player| player.id == highest_wage.player_id}
    most_expensive.name
end
# longest injury
    def self.longest_injury
        # self.all_injured_players.each{|player|player.injury.length}

    end

    def self.find_injured_player_by_name(name)
        Player.all.find{|player| player.name == name}
    end

    def injury_length
        injury_length = self.injury_predicted_end.to_time.to_i - self.injury_start.to_time.to_i
        injury_length / (60 * 60 * 24)
    end

    def self.all_injured_players
        all_injured_players = Player.all.select{|player| player.injured?}
       puts  all_injured_players.map{|player| player.name}
    end
# most contracts at one team
# most contracts

def team
current_team = self.teams.map{|team| team.name}
current_team[0]
end

def current_position
self.position
end

def number_of_teams_played_for
    self.teams.all.uniq.count
end

# injuries after date
# current contract

end