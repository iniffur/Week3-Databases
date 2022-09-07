require 'album_repository'

RSpec.describe AlbumRepository do
    def reset_album_table
        user = 'iniffur'
        password = ENV['PGPASSWORD']
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test', user: user, password: password })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_album_table
    end

    it 'Returns all Albums' do
        repo = AlbumRepository.new

        albums = repo.all

        expect(albums.length).to eq(2)

        expect(albums.first.id).to eq '1'
        expect(albums.first.title).to eq 'Bossanova'
        expect(albums.first.release_year).to eq '1999'
        expect(albums.first.artist_id).to eq '1'
    end

    it "Returns first album: Bossanova" do
        repo = AlbumRepository.new

        album = repo.find(1)

        expect(album.title).to eq 'Bossanova'
        expect(album.release_year).to eq '1999'
        expect(album.artist_id).to eq '1'
    end

    it "Creates a new album" do
        repo = AlbumRepository.new
        album = Album.new

        album.title = 'Trompe le Monde'
        album.release_year = '1991'
        album.artist_id = '1'

        repo.create(album)
        albums = repo.all

        last_album = albums.last

        expect(last_album.title).to eq 'Trompe le Monde'
        expect(last_album.release_year).to eq '1991'
        expect(last_album.artist_id).to eq '1'
    end
end