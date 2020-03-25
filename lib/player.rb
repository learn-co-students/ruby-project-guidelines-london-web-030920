class Player < ActiveRecord::Base
    has_many :contracts
    has_many :teams, through: :contracts
    
# most expensive player

    def self.find_player(name) 
        Player.all.find{|player| player.name == name}
    end

    def self.all_players
            all_players = self.all.map{|player| player.name}
            all_players.join(" ")
            
    end

####################ALL PLAYER METHODS ###################### ALL PLAYER METHODS #######################

    def self.all_players_by_contracts                       #creates a hash that gives all the players contracts
        hash = {}
        Player.all.map {|player|hash["#{player.name}"] =  player.contracts}
        hash
    end

    def self.player_contracts(name)                                                             #find's players individual contracts by comparing the name inputted against the hash created in all_players_contracts
        Player.all_players_by_contracts.find{|player, contract| name == player}
    end

    def self.most_expensive_wage
        highest_wage = Contract.all.max{|contract|contract.wage}                                #looks through all the contracts and returns the highest contract instance
    end

    def self.most_expensive_player
        most_expensive = self.all.find{|player| player.id == most_expensive_wage.player_id}     #finds the most expensive player instance by looking for the player_id matching the most_expensive_wage player_id
        puts "#{most_expensive.name} = £#{self.most_expensive_wage.wage} per second"            #returns the most_expensive player name and the most_expensive_wage amount
    end

    # def self.longest_injury
    #     # self.all_injured_players.each{|player|player.injury.length}

    # end

        ######### INJURIES METHODS ############# INJURIES METHODS ###########
   

    def injury_length                                                                            #calculates the number of days injury totals
        injury_length = self.injury_predicted_end.to_time.to_i - self.injury_start.to_time.to_i     #is making a variable that turns the predicted and end dates of injury into integers (in seconds) and takes the start away from the end
        total_days_injured = injury_length / (60 * 60 * 24)                                      #takes the variable and divides it by a calculation that returns number of days
        total_days_injured
    end

    # def expected_days_from_injury_return(player)

    # end

    def self.all_injured_players                                                #returns on separate lines each injured player in the players table
        all_injured_players = Player.all.select{|player| player.injured?}
       puts  all_injured_players.map{|player| player.name}
    end

    ################## CONTRACT METHODS #################### CONTRACT METHODS #######################


# most contracts

#################### INDIVIDUAL PLAYER METHODS ########### INDIVIDUAL PLAYER METHODS #######################

    def team
    current_team = self.teams.map{|team| team.name}    #returns players current team as a string by mapping through the teams played for and returning the first array element
    current_team[0]
    end

    def current_position       #returns current position
    self.position
    end

    def number_of_teams_played_for  #looks at players teams, calculates the unique number of teams played for.
        self.teams.all.uniq.count
    end

# current contract

end

#####UNUSED METHODS ############## UNUSED METHODS ####################

        # def self.player_injured(name) 
        #     Player.all.find{|player| player.name == name}.injured?
        # end   