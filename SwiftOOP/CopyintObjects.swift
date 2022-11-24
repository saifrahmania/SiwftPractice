class Singer{
    var name = "Taylor Swift"
    var genre = "Pop"

}

var singer = Singer()
print(singer.genre)

//copying objects
var singerCopy = singer
singerCopy.name = "Eminem"
singerCopy.genre = "Rap"
print(singer.genre)
print(singerCopy.genre)