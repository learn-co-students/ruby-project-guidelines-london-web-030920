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

    def screen3_player_search
    
      puts "hey"
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
        puts  "#{Player.all_players}"
      puts "Searching for all player related queries..."
    when 2
      # Functionality for Choice 2 goes here
      puts "Searching for all team related queries..."
    when 3
      # Functionality for Choice 3 goes here
      puts "Searching for all contracts..."

    when 4
        $prompt.yes?('Are you sure?')
       system "clear"
    end









    end
# for when you are looking for if a player is injured
# when 1
#   name = gets.chomp
#   player = Player.find_player(name)  
#   if !player.injured 
#     puts "#{player.name} is not currently injured."
#   else 
#     puts "#{player.name} is injured for #{player.injury_length} days since #{player.injury_start}."
#   end



   

end
