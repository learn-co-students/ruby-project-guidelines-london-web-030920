class CommandLineInterface

    def opening_greeting
      puts "Welcome to Movie Quotes."
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
      puts "movies - list all movies"
    end

    def user_command(command)
      case command

      when "l"
        list_all_commands
      when "movies"
        puts Movie.all.map{|m| m.title}
      # when expression "quotes"
      #   list_all_quotes
      # when expression "characters"
      #   list_all_characters
      # when expression "random"
      #   random_quote
      # when expression "quote finder"
      #   quote_finder
      # when expression "movie finder"
      #   movie_finder
      # when expression "character finder"
      #   character_finder
      # when expression "quote from movie"
      #   list_all_movie_quotes
      # when expression "characters from movie"
      #   list_all_movie_character
      # when expression "quotes from character"
      #  list_all_character_quotes
      # when expression "add quote and film"
      #   add_quote_film
      # when expression "delete quote" 
      #   delete_quote
    end
  end

end