require "tty-prompt"
class CommandLineInterface
 


def greet
    puts "Welcome to Focus Football, the best resource for football information in the world! \n"
  end

    
   
  def screen1

    greet
    puts "Fancy checking in on your favourite player? Maybe seeing the current players in a team? How about their contracts?"
    prompt = TTY::Prompt.new
    prompt.ask('What is your name?', default: ENV["Stranger"])

    choices = [
      {name: 'Search all players', value: 1},
      {name: 'Search all teams', value: 2},
      {name: 'Search all contracts', value: 3},
      {name: "Exit", value: 4}]

    user_input = prompt.select("Select an action?", choices)

        case user_input
    when 1
          Player.all_players_by_contracts 
      puts "Searching for all player related queries..."
    when 2
      # Functionality for Choice 2 goes here
      puts "Searching for all team related queries..."
    when 3
      # Functionality for Choice 3 goes here
      puts "Searching for all contracts..."

    when 4
      are_you_sure = prompt.yes?('Are you sure?')
    end

    case are_you_sure
    when "Y" 
      puts "Have a great day"
    end

    end




   

end
