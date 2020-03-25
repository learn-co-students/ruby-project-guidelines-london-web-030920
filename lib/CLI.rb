class CommandLineInterface

    def opening_greeting
      puts ""
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
      puts "quotes - list all quotes"
      puts "characters - list all characters"
    end

    def user_command(command)
      case command

      when "l"
        list_all_commands
      when "movies"
        puts Movie.all.map{|m| m.title}
      # when expression "quotes"
      #   list_all_quotes
      when "quotes"
        puts Quote.all.map{|q| q.line}
      when "characters"
       puts Character.all.map{|c| "#{c.first_name} #{c.last_name}"}
      when "random"
       puts Quote.all.sample
      # when expression "quote finder"
      when "find quote"
        puts "Type in your quote"
        quote = gets.chomp
        Quote.find_movie(quote)
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