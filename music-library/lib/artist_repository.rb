require 'artist'

class ArtistRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
      sql = 'SELECT id, name, genre FROM artists;'
      result_set = DatabaseConnection.exec_params(sql, [])
      # Returns an array of Artists objects.

      artists = []

      result_set.each do |record|
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']

        artists << artist
      end
      return artists
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, name, genre FROM artists WHERE id = $1;
  
      # Returns a single Artist object.
    end
  
    # Add more methods below for each operation youd like to implement.
  
    # def create(artist)
    #INSERT
    # end
  
    # def update(artist)
    #UPDATE
    # end
  
    # def delete(artist)
    #DELETE
    # end
  end