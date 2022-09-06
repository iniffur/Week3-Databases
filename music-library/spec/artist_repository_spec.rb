require 'artist_repository'

RSpec.describe ArtistRepository do

    def reset_artist_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_artist_table
    end

    it '' do
        repo = ArtistRepository.new

        artists = repo.all

        expect(artists.length).to eq(2) # =>  2

        expect(artists.first.id).to eq '1' # =>  1
        expect(artists.first.name).to eq 'Pixies' # =>  'Pixies'
        expect(artists.first.genre).to eq 'Rock' # =>  'Rock'

        # 2
        # Get a single artist

        # repo = ArtistRepository.new

        # artist = repo.find(1)

        # artist.id # =>  1
        # artist.name # =>  'Pixies'
        # artist.genre # =>  'Rock'
    end
end