# file: app.rb
require_relative './lib/database_connection'
require_relative './lib/album_repository'
require_relative './lib/artist_repository'


class Application


    def initialize(music_library, io, album_repository, artist_repository)
      DatabaseConnection.connect(music_library)
      @io = io
      @album_repository = album_repository
      @artist_repository = artist_repository
    end

    def run
        @io.puts "Welcome to the music library manager"
        @io.puts "What would you like to do?"
        @io.puts "1 - List all albums"
        @io.puts "2 - List all artists"
        @io.puts "Enter your choice:"
        user_choice = gets_num
        if user_choice == 1
            @album_query = 'SELECT * FROM albums;'
            @album_result = DatabaseConnection.exec_params(@album_query, [])
            @album_result.each do |record|
                @io.puts ("* #{record['id']} - #{record['title']}")
            end
        elsif user_choice == 2
            @artist_query = 'SELECT * FROM artists;'
            @artist_result = DatabaseConnection.exec_params(@artist_query, [])
            @artist_result.each do |record|
                @io.puts ("* #{record['id']} - #{record['name']}")
            end
        end
    end

    def gets_num
        input = @io.gets.chomp
        return input.to_i if input == '1' || input == '2'
        fail "Please enter a valid number"
    end
  end
  
   if __FILE__ == $0
    app = Application.new(
      'music_library',
      Kernel,
      AlbumRepository.new,
      ArtistRepository.new
    )
    app.run
  end