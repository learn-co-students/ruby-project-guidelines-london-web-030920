require "tty-prompt"
class CommandLineInterface
 $prompt = TTY::Prompt.new

def greet
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
      {name: "Exit", value: 5}]

    user_input = $prompt.select("Select an action?", screen2)

        case user_input
   
          when 1
            screen3_all_players

          when 2
            screen4_all_teams
          when 3
            # Functionality for Choice 3 goes here
            puts "Searching for all contracts..."

          when 4
            create_new

          when 5
              $prompt.yes?('Are you sure?')
            system "clear"
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
          screen2_selection
        end

      screen3 = [
          {name: 'Is the player injured?', value: 1},
          {name: 'Teams past and present', value: 2},
          {name: 'Current position', value: 3},
          {name: "Back to homepage", value: 4},
          {name: "Exit", value: 5}]
    
      user_input = $prompt.select("Select an action?", screen3)
    
            case user_input
       
              when 1
                is_injured?
                $prompt.keypress("Resumes automatically in :countdown ...", timeout: 3)
                $prompt.select("Select an action?", screen3)
          
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

              when 3
                puts "Current position: #{found_player.position}."
          
              when 4
                screen2_selection

              when 5
                $prompt.yes?('Are you sure?')
                system "clear"
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
          screen2_selection
        end

        @screen4 = [
          {name: 'Which team has won the most cups?', value: 1},
          {name: 'Who is currently injured?', value: 2},
          {name: 'Average wage of the team:', value: 3},
          {name: 'Total wages of whole team:', value: 4},
          {name: 'Most expensive player:', value: 5},
          {name: 'Highest earning player:', value: 6},
          {name: 'Lowest earning player:', value: 7},
          {name: 'Oldest player:', value: 8},
          {name: 'Youngest player:', value: 9},
          {name: "Back to homepage", value: 10},
          {name: "Exit", value: 11}]
    
        user_input = $prompt.select("Select an action?", @screen4)

        case user_input
          when 1
            puts found_team.most_cup_wins
            screen4_back
          when 2
            if found_team.all_injuries.count == 0
              puts "This team has great medical staff, no injured players!"
              else 
              found_team.injured_players
              end
            screen4_back
       
          when 3  
            puts found_team.average_wage_of_team
            screen4_back
          when 4
            puts found_team.total_of_team_wage
            screen4_back
          when 5
            puts found_team.most_expensive_player
            screen4_back
          when 6
            puts found_team.highest_earner
            screen4_back
          when 7
            puts found_team.lowest_earner
            screen4_back
          when 8
            puts found_team.oldest_player
            screen4_back
          when 9
            puts found_team.youngest_player
            screen4_back
          when 10
            screen2_selection
        
          when 11
            
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
            
              # Player.create(name: name, age: age, position: position, injury_start: start_date, injury_predicted_end: end_date)
              end
           
              Player.create(name: new_player[:name], age: new_player[:age], position: new_player[:position], injured: new_player[:injured], injury_start: new_player[:injury_start], injury_predicted_end: new_player[:injury_predicted_end])
        
            when 2
            
            new_team = $prompt.collect do
              key(:name).ask('Team name?', required: true)
              key(:founded).ask('What year was this team founded in?', convert: :int, required: true)
              key(:cups_won).ask('How many cups has this team won?', convert: :int, required: true)
              # Player.create(name: name, age: age, position: position, injury_start: start_date, injury_predicted_end: end_date)
              end
             
              Team.create(name: new_team[:name], founded: new_team[:founded], cups_won: new_team[:cups_won])
              
            when 3

            when 4
          end
    end
  


                    ################### BOTTOM METHODS TEAMS MENU ########################



    def is_injured?
      puts player = Player.find_player(@player_selection)  
        if !player.injured 
          puts "#{player.name} is not currently injured."
        else 
          puts "#{player.name} is injured for #{player.injury_length} days since #{player.injury_start}."
        end
    end

def screen4_back
    $prompt.keypress("Resumes automatically in :countdown ...", timeout: 3)
    $prompt.select("Select an action?", @screen4)
end
