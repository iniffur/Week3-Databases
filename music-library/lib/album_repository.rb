require_relative 'album'

class AlbumRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
      # SELECT * FROM albums;
        sql = 'SELECT * FROM albums;'
        result_set = DatabaseConnection.exec_params(sql, [])
      # Returns an array of Albums objects.

      albums = []

      result_set.each do |record|
        album = Album.new
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']

        albums << album
      end
      return albums
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      sql = 'SELECT * FROM albums WHERE id = $1;'
      sql_params = [id]
      result_set = DatabaseConnection.exec_params(sql, sql_params)  

      record = result_set[0]

      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      return album

      # Returns a single Album object.
    end
  
    # Add more methods below for each operation youd like to implement.
  
    # def create(album)
    #INSERT
    # end
  
    # def update(album)
    #UPDATE
    # end
  
    # def delete(album)
    #DELETE
    # end
  end