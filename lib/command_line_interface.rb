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

    @screen2 = [
      {name: 'Search for all players in database', value: 1},
      {name: 'Search all teams', value: 2},
      {name: 'Search all contracts', value: 3},
      {name: "Exit", value: 4}]

    user_input = $prompt.select("Select an action?", @screen2)

        case user_input
   
    when 1
      screen3_all_players

    when 2
      screen4_all_teams
    when 3
      # Functionality for Choice 3 goes here
      puts "Searching for all contracts..."

    when 4
        $prompt.yes?('Are you sure?')
       system "clear"
    end

    end

    def screen3_all_players
      system "clear"

      @player_selection = gets.chomp

        found_player = Player.find{|player| player.name == @player_selection}
        puts found_player.name

     @screen3 = [
          {name: 'Is the player injured?', value: 1},
          {name: 'Teams past and present', value: 2},
          {name: 'Current position', value: 3},
          {name: "Back to homepage", value: 4},
          {name: "Exit", value: 5}]
    
        user_input = $prompt.select("Select an action?", @screen3)
    
            case user_input
       
        when 1
          is_injured?
    
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




end




    def is_injured?
      puts player = Player.find_player(@player_selection)  
      if !player.injured 
        puts "#{player.name} is not currently injured."
      else 
        puts "#{player.name} is injured for #{player.injury_length} days since #{player.injury_start}."
      end
    end


end
