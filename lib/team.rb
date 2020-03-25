class Team < ActiveRecord::Base
    has_many :contracts
    has_many :players, through: :contracts

    def team_by_contract
        hash = {}
        Team.all.map {|team|hash["#{team.name}"] =  team.contracts}
        hash
        end


    def most_expensive_player_on_team 
        self.players.find {|player| player.contracts.max_by{|contract| contract.transfer_fee}}.name
     end
    
#most expensive team
#most expensive player on team
#highest earning player on team
#cheapest team
#least expensive player on team
#most injuries
#oldest player on team
#youngest player on team
#average wage of team
#transfer fee
#contract start before a certain date

#most cup wins
def most_cup_wins
    most_cup_wins = Team.all.max_by {|team| team.cups_won}
    most_cup_wins.name
end

end