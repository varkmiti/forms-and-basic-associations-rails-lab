class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def genre_name=(name)
        self.genre = Genre.find_or_create_by(name: name)
      end
    
    def genre_name
        self.genre ? self.genre.name : nil
    end

    def artist_name 
        self.artist ? self.artist.name : nil
    end

    def artist_name=(name)
       artist = Artist.find_or_create_by(name: name) 
       self.artist = artist
       self.save
    end

    def note_contents
        self.notes.map { |note| note.content }
    end

    def note_contents=(contents)
        contents.each do |content|
            note = Note.new(content: content)
            note.save
            self.notes << note
            self.save
        end
    end

    def song_notes_1=(name)
        self.notes << Note.find_or_create_by(name: name)
      end
    
    def song_notes_1
        self.notes ? self.notes.name : nil
    end

    def song_notes_2=(name)
        self.notes << Note.find_or_create_by(name: name)
      end
    
    def song_notes_2
        self.notes ? self.notes.name : nil
    end
end
