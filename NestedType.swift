/**
        *NESTED TYPE*
 */

struct Band{
    enum MusicianType {
        case singer
        case guitar
        case keyboard
        case bass
        case drums
        
    }
    private var members: [MusicianType]
    private (set) var name: String
    init(name:String,member:[MusicianType]){
        self.name = name
        self.members = member
    }
    var description :String{
        "\(name) are made by \(members.count) members"
    }
}

let band01 = Band(name: "Dream Theater", member: [.singer,.bass,.drums,.guitar,.keyboard])
let band02 = Band(name: "IronMaide", member: [.singer,.bass,.drums,.guitar,.guitar,.drums])
