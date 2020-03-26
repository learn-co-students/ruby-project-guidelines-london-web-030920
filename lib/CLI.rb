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
    puts "g - find by genre"
    puts "r - random quote"
    puts "f - find movie, quote or character"
    puts "fc - find or create quote"
    puts "exit - to exit application"
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
     puts Character.all.map{|c| c.name}
    when "g" #genre
      display_genre_quotes_and_movies 
    when "r"
     puts Quote.all.sample
    when "f" #find
      find_by_character_movie_or_quote
    when "fc"
      find_or_create
    when "exit"
      puts ""
      puts "Thanks for visiting us!"
      

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
  puts "Press 'c' to find by character"
  puts "Press 'm' to find by movie"
  puts ""
  command = gets.chomp
  case command
  when "q"
    puts ""
    puts "Type in your quote"
    puts ""
      quote = gets.chomp
      puts Quote.find_by(line: quote).movie.title
  when "c"
    puts ""
    puts "Type in your character"
    puts ""
    character_name = gets.chomp.split(" ")
    puts ""
      puts Character.find_by(name: character_name[0]).quotes.map {|q| q.line}
  when "m"
    puts ""
    puts "Type in your movie"
    puts ""
    movie_title = gets.chomp
    puts ""
    puts Movie.find_by(title: movie_title).quotes.map {|q| q.line}
  end
end

def find_or_create
  puts ""
  puts "Put your movie title in"
  movie_title = gets.chomp
  found_movie = Movie.find_by(title: movie_title)
  if found_movie
    puts ""
    puts "This movie is in our Database! Please type in the name of the character who has a quote."
    create_or_find_character_and_quote(found_movie)
  else
      puts ""
      puts "This Movie is not in our database, please type the name of the Movie"
      movie_name = gets.chomp 
      puts "" 
      puts "Now, please put in the year of the Movie."
      puts "" 
      movie_year = gets.chomp
      puts "" 
      puts "Now, please put in the movie Genre."
      puts "" 
      movie_genre = gets.chomp
      puts ""
      new_movie = Movie.create(title: movie_name, year: movie_year, genre: movie_genre)
      puts ""
      puts "This movie is now in our database, please type the character who says the quote."
      create_or_find_character_and_quote(new_movie)
  end
  inner_greeting
end

def create_or_find_character_and_quote(movie)
  found_movie = movie
  new_character = gets.chomp
  found_character = Character.find_by(name: new_character)
    if found_character
      puts ""
      puts "This character is in our Database! Please type in the quote this character says."
      new_quote = gets.chomp
      Quote.create(line: new_quote, movie_id: found_movie.id, character_id: found_character.id)
    else
      puts "This character is not in out Database. Please type in the characters full name."
      puts "" 
      new_character = gets.chomp
      puts ""
      puts "Now, please type in the gender of the character, using either M or F."
      new_gender = gets.chomp
      created_character = Character.create(name: new_character, sex: new_gender)
      puts "This character is now in our Database! Please type in the quote this character says."
      new_quote = gets.chomp
      Quote.create(line: new_quote, movie_id: found_movie.id, character_id: created_character.id)
    end
end

def display_genre_quotes_and_movies 
  puts ""
  puts "Enter a film genre"
  genre = gets.chomp
  puts ""
  
  counter = 0
  movies = Movie.all.select{|m| m.genre == genre}

  while counter < movies.length
    puts movies[counter].title
    puts ""
    puts movies[counter].quotes.map {|q| q.line}
    puts ""
    counter += 1
  end
  
end

end
