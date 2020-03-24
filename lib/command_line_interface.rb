class CommandLineInterface

def greet
    puts 'Welcome to Focus Football, the best resource for football information in the world!'
  end
   
  def run
    greet
    puts "Thinking of eating somewhere but not sure if it's good? We can help you with that decision!"
    puts "Enter a restaurant name to get started:"
    name = gets.chomp
    found_player = Player.find_by(name: name)
    puts ""
    puts "name: #{found_player.name}"
  end

end