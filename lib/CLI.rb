class CommandLineInterface

    def opening_greeting
      puts ""
      puts "Welcome to Movie Quotes."
      puts ""
      inner_greeting
    end

    def inner_greeting
      puts "Press 'l' for a list of commands."
      command = gets.chomp
      if command == "l"
        list_all_commands
        type_in_next_command
      else
        puts "Invalid key, please try again."        
        inner_greeting
        list_all_commands
        type_in_next_command
      end
    end

    def type_in_next_command
      puts ""
      puts "Please type your next command."
      puts ""
      command = gets.chomp
      user_command(command) 
    end

    def list_all_commands
      puts ""
      puts "COMMAND LIST"
      puts "-------------"
      puts "l - list all abjects"
      puts "m - list all movies"
      puts "q - list all quotes"
      puts "c - list all characters"
      puts "f - find movie, quote or character"
    end

    def user_command(command)
      case command

      when "l"
        list_all_commands
      when "m" #movie
        puts Movie.all.map{|m| m.title}
      when "q" #quotes
        puts Quote.all.map{|q| q.line}
      when "c" #characters
       puts Character.all.map{|c| "#{c.first_name} #{c.last_name}"}
      when "random"
       puts Quote.all.sample
      when "f" #find
        find_by_character_movie_or_quote

        # - movie finder 
        # - character finder 

        # - all character quotes
        # - all movie quotes
        # - all genre movies

        # - add movie quote (find or create)
        # - delete quote 
        # - delete movie and quote 

        # - oldest movie
        # - 

    end
  end

  def find_by_character_movie_or_quote 
    puts ""
    puts "Press 'q' to find by quote"
    puts "Press 'm' to find by movie"
    puts "Press 'm' to find by movie"
    puts ""
    command = gets.chomp
    case command
    when "q"
      puts ""
      puts "Type in your quote"
      puts ""
        quote = gets.chomp
        # binding.pry
        # found_quote = Quote.find_by(line: quote).movie.title
        puts Quote.find_by(line: quote).movie.title
    end
  end


end

