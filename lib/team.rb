class Team < ActiveRecord::Base
    has_many :contracts
    has_many :players, through: :contracts

  
    def team_contract
        Contract.all.select {|contract| contract.team_id == self.id}
     end

     def total_of_team_fee
        self.team_contract.sum {|contract| contract.transfer_fee}
     end

     def total_of_team_wage
        self.team_contract.sum {|contract| contract.wage}
     end

     def most_expensive_player
        player_contract = team_contract.max_by{|contract| contract.transfer_fee}
        Player.all.find {|player| player.id == player_contract.player_id}.name
     end

     def highest_earner
        player_contract = team_contract.max_by{|contract| contract.wage}
        Player.all.find {|player| player.id == player_contract.player_id}.name
     end

     def lowest_earner
        player_contract = team_contract.min_by{|contract| contract.transfer_fee}
        Player.all.find {|player| player.id == player_contract.player_id}.name
     end

     def average_wage_of_team
        player_contract = team_contract.map{|contract| contract.wage}.sum
        player_contract/self.players.length
     end

     def oldest_player
        self.players.max_by {|player| player.age}.name
     end

     def youngest_player
        self.players.min_by {|player| player.age}.name
     end

     def all_injuries
        self.players.select {|player| player.injured == true}
     end

     def injured_players
        players_injured = all_injuries.map {|player| player.name}
        puts "#{players_injured.join(" and ")} are injured for #{self.name}!"
     end
    
    def most_cup_wins
     most_cups_won = Team.all.max_by {|team| team.cups_won}
     most_cups_won.name
    end

    def oldest_team
        old_team = Team.all.min_by {|team| team.founded}
        old_team.name
    end

end