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

    def screen3_all_players
      system "clear"

      @player_selection = gets.chomp

        found_player = Player.find{|player| player.name == @player_selection}
        puts found_player.name

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
          puts "Current team: #{found_player.find_team}"
          if found_player.number_of_teams_played_for > 1
          puts "Previously played for #{found_player.previous_teams_played_for}."
          else
            puts "Loyal to this club."
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

      def screen4_all_teams

        system "clear"

      @team_selection = gets.chomp

      found_team = Team.find{|team| team.name == @team_selection}

        screen4 = [
          {name: 'Which team has won the most cups?', value: 1},
          {name: 'Who is currently injured?', value: 2},
          {name: 'Average wage of the team', value: 3},
          {name: "Back to homepage", value: 4},
          {name: "Exit", value: 5}]
    
        user_input = $prompt.select("Select an action?", screen4)

        case user_input
       
        when 1
          
          puts oldest_team
    
        when 2
         if found_team.all_injuries.count == 0
            puts "This team has great medical staff, no injured players!"
            else 
            found_team.injured_players
            end
       

        when 3
         
    
        when 4
          screen2_selection

        when 5
          
        end

      end

end


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
              binding.pry
              Player.create(name: new_player[:name], age: new_player[:age], position: new_player[:position], injured: new_player[:injured], injury_start: new_player[:injury_start], injury_predicted_end: new_player[:injury_predicted_end])
              
          when 2

          when 3

          when 4

    end
  end




    def is_injured?
      puts player = Player.find_player(@player_selection)  
      if !player.injured 
        puts "#{player.name} is not currently injured."
      else 
        puts "#{player.name} is injured for #{player.injury_length} days since #{player.injury_start}."
      end
    end



