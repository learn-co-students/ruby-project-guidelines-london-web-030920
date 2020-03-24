class CommandLineInterface

    def greeting
      puts "Welcome to Movie Quotes."
      puts "Press 'l' for a list of commands."
    end

    def user_command(command)
      case command

      when expression "l"
        list_all_commands
      when expression "movies"
        list_all_movies
      when expression "quotes"
        list_all_quotes
      when expression "characters"
        list_all_characters
      when expression "random"
        random_quote
      when expression "quote finder"
        quote_finder
      when expression "movie finder"
        movie_finder
      when expression "character finder"
        character_finder
      when expression "quote from movie"
        list_all_movie_quotes
      when expression "characters from movie"
        list_all_movie_character
      when expression "quotes from character"
       list_all_character_quotes
      when expression "add quote and film"
        add_quote_film
      when expression "delete quote" 
        delete_quote
    end

end