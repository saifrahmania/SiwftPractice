// MARK: Type Casting
class MediaItem{
    var name:String
    init(name:String){
        self.name = name
        
    }
}

class Movie:MediaItem{
    var director:String
    init(name:String,director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String,artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [Movie(name: "Casa", director: "Blanka"),
Song(name: "Blue", artist: "Suede")]

/*
    * this part works for downcasting
*/

for i in library{
    if let m = i as? Movie{
        print(m.director)
    }
    else if i is Song{
        print((i as! Song).artist)
    }
}
