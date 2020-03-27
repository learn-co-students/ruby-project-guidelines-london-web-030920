require "tty-prompt"
class CommandLineInterface
 $prompt = TTY::Prompt.new # initialize instead of global

 def initialize
   @favourite_team = []
   @favourite_player = []
 end

def greet
  system "clear"
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('Focus Football !')
    puts "Welcome to Focus Football, the best resource for football information in the world! "
    puts ""
  end
   
  def screen1
    greet
    puts "Fancy checking in on your favourite player? Maybe seeing the current players in a team? How about their contracts?"
    $prompt.ask('What is your name?', default: "Anonymous")
  end

                              ################### SCREEN 2 HOMEPAGE MENU ########################
                              ################### SCREEN 2 HOMEPAGE MENU ########################
                              ################### SCREEN 2 HOMEPAGE MENU ########################

  def screen2_selection
    system "clear"

    screen2 = [
      {name: 'Search for all players in database', value: 1},
      {name: 'Search all teams', value: 2},
      {name: 'Search all contracts', value: 3},
      {name: 'Create new player, team or contract', value: 4},
      {name: 'My favourites', value: 5},
      {name: "Exit", value: 6}]

    user_input = $prompt.select("Select an action?", screen2)

        case user_input
   
          when 1
            screen3_all_players

          when 2
            screen4_all_teams

          when 3
            screen7_all_contracts

          when 4
            create_new

          when 5
            my_favourites

          when 6
            exit_all
          end

    end

                            ################### SCREEN 3 PLAYERS MENU ########################
                            ################### SCREEN 3 PLAYERS MENU ########################
                            ################### SCREEN 3 PLAYERS MENU ########################

    def screen3_all_players
      system "clear"
      puts "Please type in player:"
      @player_selection = gets.chomp

      found_player = Player.find{|player| player.name == @player_selection}
        if !found_player
          system "clear"
          puts "This player does not exist yet!"
          puts "Please navigate to the bottom of the homepage to create this new player!"
          $prompt.keypress("Resumes automatically in :countdown ...", timeout: 5)
          screen2_back
        end

      screen3 = [
          {name: 'Is the player injured?', value: 1},
          {name: 'Teams past and present?', value: 2},
          {name: 'Current position?', value: 3},
          {name: "Update player position", value: 4},
          {name: "Back", value: 5}]
    
      user_input = $prompt.select("Select an action?", screen3)
    
            case user_input
       
              when 1
                is_injured?

                screen2_back
          
              when 2
                if found_player.number_of_teams_played_for > 1
                  puts "Current team: #{found_player.find_team}"
                  puts "Previously played for #{found_player.previous_teams_played_for}."
                elsif found_player.number_of_teams_played_for == 1
                  puts "Current team: #{found_player.find_team}"
                  puts "Loyal to this club."
                else
                  puts "Has no current team."
                end
                screen2_back
              when 3
                puts "Current position: #{found_player.position}."
                screen2_back
              when 4
                system "clear"
                  puts "#{@player_selection} currently plays #{found_player.position}."

                user = Player.find_by(name: @player_selection)
                  puts "What position have they changed to?"
                  choices = %w(Goalkeeper Striker Midfielder Defender)
                  new_position = $prompt.select("Select position?", choices)
                user.update(position: new_position)
                screen2_back

              when 5
                screen2_back
              end

  # goes to menu with options for
  # Current contract
  # Current wage
    end


                            ################### SCREEN 4 TEAMS MENU ########################
                            ################### SCREEN 4 TEAMS MENU ########################
                            ################### SCREEN 4 TEAMS MENU ########################

      def screen4_all_teams

        system "clear"
        puts "Please type in team:" 
      @team_selection = gets.chomp

      found_team = Team.find{|team| team.name == @team_selection}
        if !found_team         
          system "clear"
          puts "This team does not exist yet!"
          puts "Please navigate to the bottom of the homepage to create this new team!"
          $prompt.keypress("Resumes automatically in :countdown ...", timeout: 5)
          screen2_back
        end

        @screen4 = [
          {name: 'Which team has won the most cups?', value: 1},
          {name: 'Who is currently injured?', value: 2},
          {name: 'Average wage of the team?', value: 3},
          {name: 'Total wages of whole team?', value: 4},
          {name: 'Most expensive player?', value: 5},
          {name: 'Highest earning player?', value: 6},
          {name: 'Lowest earning player?', value: 7},
          {name: 'Oldest player?', value: 8},
          {name: 'Youngest player?', value: 9},
          {name: "Back to homepage", value: 10},
          {name: "Exit", value: 11}]
    
        user_input = $prompt.select("Select an action?", @screen4)

        case user_input
          when 1
            puts found_team.most_cup_wins
            screen2_back
          when 2
            if found_team.all_injuries.count == 0
              puts "This team has great medical staff, no injured players!"
              else 
              found_team.injured_players
              end
              screen2_back
       
          when 3  
            puts found_team.average_wage_of_team
            screen4_back
          when 4
            puts found_team.total_of_team_wage
            screen2_back
          when 5
            puts found_team.most_expensive_player
            screen2_back
          when 6
            puts found_team.highest_earner
            screen2_back
          when 7
            puts found_team.lowest_earner
            screen2_back
          when 8
            puts found_team.oldest_player
            screen2_back
          when 9
            puts found_team.youngest_player
            screen2_back
          when 10
            screen2_back
        
          when 11
            screen2_back
          end

      end

end
                        ################### SCREEN 5 CREATE NEW MENU ########################
                        ################### SCREEN 5 CREATE NEW MENU ########################
                        ################### SCREEN 5 CREATE NEW MENU ########################

    def create_new
      system "clear"

      screen5 = [
        {name: 'Create new player', value: 1},
        {name: 'Create new team', value: 2},
        {name: 'Create new contract', value: 3},
        {name: 'Back', value: 4}
      ]
  
      user_input = $prompt.select("What would you like to add?", screen5)
  
          case user_input
            when 1
            new_player = $prompt.collect do
              key(:name).ask('Surname?', required: true)
              key(:age).ask('Age?', convert: :int, required: true)
              key(:position).ask('Position?', required: true)
              key(:injured).ask('Injured?', convert: :bool, required: true)
              puts "If the player is not injured, simply press return for the next two questions."
              key(:injury_start).ask('What date did the injury occur?', default: nil)
              key(:injury_predicted_end).ask('What date do they expect to be fit again?', default: nil)
          
              end
              Player.create(name: new_player[:name], age: new_player[:age], position: new_player[:position], injured: new_player[:injured], injury_start: new_player[:injury_start], injury_predicted_end: new_player[:injury_predicted_end])
              screen2_back

            when 2
            
            new_team = $prompt.collect do
              key(:name).ask('Team name?', required: true)
              key(:founded).ask('What year was this team founded in?', convert: :int, required: true)
              key(:cups_won).ask('How many cups has this team won?', convert: :int, required: true)
              
              end
             
              Team.create(name: new_team[:name], founded: new_team[:founded], cups_won: new_team[:cups_won])
              screen2_back
            when 3
              puts "You need to have made a player and a team before creating a contract!"
              new_contract = $prompt.collect do
                key(:start_day).ask('Start date:', convert: :date, required: true)
                key(:end_day).ask('End date:', convert: :date, required: true)
                key(:wage).ask('Wage: £', convert: :int, required: true)
                key(:transfer_fee).ask('Transfer Fee:', convert: :int, required: true)
                
                key(:player_surname).ask('What is their surname?', required: true)
                key(:team_name).ask('What is the name of their team?', required: true)
                
                end

                player_name_check = new_player[:name]
                team_name_check = new_team[:name]
                id_of_player = Player.find_player(player_name_check)
                id_of_team = Team.find_team(team_name_check)
                
                Contract.create(start_day: new_contract[:start_day], end_day: new_contract[:end_day], wage: new_contract[:wage], transfer_fee: new_contract[:transfer_fee], player_id: id_of_player.id, team_id: id_of_team.id)
                screen2_back

            when 4
              screen2_back
          end
    end
  
                    ################### MY FAVOURITES #######################
                    ################### MY FAVOURITES #######################
                    ################### MY FAVOURITES #######################

  def my_favourites
    system "clear"

    screen6 = [
      {name: 'Select your favourite players', value: 1},
      {name: 'Select your favourite team', value: 2},
      {name: 'Your chosen favourites', value: 3},
      {name: 'Delete all', value: 4},
      {name: 'Back', value: 5}
                    ]
                
      user_input = $prompt.select("What would you like to select?", screen6)
                
      case user_input

        when 1
          choose_favourite_player
          screen2_back
        when 2
          choose_favourite_team
          screen2_back
        when 3

          favourites_list
          my_favourites
          screen2_back
        when 4
          $prompt.yes?('Are you sure? This will clear your my favourites list.')
          @favourite_player.clear
          @favourite_team.clear
          screen2_back
        when 5
          screen2_back
      end 
   end    
  
                    ################### CONTRACTS MENU ########################
                    ################### CONTRACTS MENU ########################
                    ################### CONTRACTS MENU ########################
def screen7_all_contracts
  screen7 = [
    {name: 'Wage total per week', value: 1},
    {name: 'Back', value: 2}
                  ]
              
    user_input = $prompt.select("What would you like to select?", screen7)
              
    case user_input
    when 1
      puts "A total of £#{Contract.total_wage_amount} is spent per week on wages."
    when 2
      screen2_back
    end
end


                     ################### METHODS MENU ########################
                     ################### METHODS MENU ########################
                     ################### METHODS MENU ########################


    def is_injured?
      puts player = Player.find_player(@player_selection)  
        if !player.injured 
          puts "#{player.name} is not currently injured."
        else 
          puts "#{player.name} is injured for #{player.injury_length} days since #{player.injury_start}."
        end
    end



def screen2_back
  $prompt.keypress("Resumes automatically in :countdown ...", timeout: 5)
  $prompt.select("Select an action?", screen2_selection)
end

def choose_favourite_player
  favourite_player = []
  puts "Choose your favourite players: "
  player_name = gets.chomp 
  player = Player.find_player(player_name)
  @favourite_player << player.name
  output_favourite_player
  my_favourites
end

def choose_favourite_team
  @favourite_team = []
  puts "Choose your favourite team: "
  team_name = gets.chomp 
  team = Team.find_team(team_name)
  @favourite_team << team.name 
  output_favourite_team 
  my_favourites
end

def output_favourite_team
@favourite_team.each{|team| puts team}
end

def favourites_list
  puts "Your favourite players are:"
  output_favourite_player
  puts ""
  puts "Your favourite team is: " 
  output_favourite_team 
  screen2_back
end

def output_favourite_player
  @favourite_player.each{|player| puts player}
  end

  def exit_all
    $prompt.yes?('Are you sure?')
    system "clear"
  end