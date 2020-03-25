require "tty-prompt"
class CommandLineInterface
 

def greet
    puts 'Welcome to Focus Football, the best resource for football information in the world!'
  end

    
   
  def run
    prompt = TTY::Prompt.new
    greet
    puts "Fancy checking in on your favourite player? Maybe seeing the current players in a team? How about their contracts?"
    
    prompt.ask('What is your name?', default: ENV['USER'])

    puts "Enter a command to get started:"
    command = gets.chomp
    
# list of commands to enter
#  p for players
#  t for teams
#  c for contracts
  end

   

end

    # found_player = Player.find_by(name: name)
    # puts ""
    # puts "name: #{found_player.name}"