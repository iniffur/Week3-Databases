require_relative '../app'

RSpec.describe Application do
    it "Print's off a list of albums if 1 is inputed" do
        io = double :io

        expect(io).to receive(:puts).with("Welcome to the music library manager").ordered
        expect(io).to receive(:puts).with("What would you like to do?").ordered
        expect(io).to receive(:puts).with("1 - List all albums").ordered
        expect(io).to receive(:puts).with("2 - List all artists").ordered
        expect(io).to receive(:puts).with("Enter your choice:").ordered
        expect(io).to receive(:gets).and_return("1").ordered
        expect(io).to receive(:puts).with("* 1 - Doolittle").ordered
        expect(io).to receive(:puts).with("* 2 - Surfer Rosa").ordered
        expect(io).to receive(:puts).with("* 3 - Waterloo").ordered
        expect(io).to receive(:puts).with("* 4 - Super Trouper").ordered
        expect(io).to receive(:puts).with("* 5 - Bossanova").ordered
        expect(io).to receive(:puts).with("* 6 - Lover").ordered
        expect(io).to receive(:puts).with("* 7 - Folklore").ordered
        expect(io).to receive(:puts).with("* 8 - I Put a Spell on You").ordered
        expect(io).to receive(:puts).with("* 9 - Baltimore").ordered
        expect(io).to receive(:puts).with("* 10 - Here Comes the Sun").ordered
        expect(io).to receive(:puts).with("* 11 - Fodder on My Wings").ordered
        expect(io).to receive(:puts).with("* 12 - Ring Ring").ordered

        album_repository = AlbumRepository.new
        artist_repository = ArtistRepository.new

        application = Application.new('music_library', io, album_repository, artist_repository)
        application.run
    end

    it "Print's off a list of artists if 2 is inputed" do
        io = double :io
 
        expect(io).to receive(:puts).with("Welcome to the music library manager").ordered
        expect(io).to receive(:puts).with("What would you like to do?").ordered
        expect(io).to receive(:puts).with("1 - List all albums").ordered
        expect(io).to receive(:puts).with("2 - List all artists").ordered
        expect(io).to receive(:puts).with("Enter your choice:").ordered
        expect(io).to receive(:gets).and_return("2").ordered
        expect(io).to receive(:puts).with("* 1 - Pixies").ordered
        expect(io).to receive(:puts).with("* 2 - ABBA").ordered
        expect(io).to receive(:puts).with("* 3 - Taylor Swift").ordered
        expect(io).to receive(:puts).with("* 4 - Nina Simone").ordered

        album_repository = AlbumRepository.new
        artist_repository = ArtistRepository.new

        application = Application.new('music_library', io, album_repository, artist_repository)
        application.run
     end

     it "Checks if a valid input is given" do
        io = double :io
        expect(io).to receive(:puts).with("Welcome to the music library manager").ordered
        expect(io).to receive(:puts).with("What would you like to do?").ordered
        expect(io).to receive(:puts).with("1 - List all albums").ordered
        expect(io).to receive(:puts).with("2 - List all artists").ordered
        expect(io).to receive(:puts).with("Enter your choice:").ordered
        expect(io).to receive(:gets).and_return("2.4").ordered

        album_repository = AlbumRepository.new
        artist_repository = ArtistRepository.new
 
        application = Application.new('music_library', io, album_repository, artist_repository)

        expect {application.run}.to raise_error "Please enter a valid number"

     end

end