struct Size{
    var width = 0.0, height = 0.0
    
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin  = Point()
    var size = Size()
}

let defaultReact = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 2.0))

extension Int{
    func repetitation(task: ()->Void){
        for  _ in 0..<self{
            task()
        }
    }
}

3.repetitation {
    print("Hello")
}

/**
    *Mutating instance Method*
 */

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()

/*
        *Subscript*
 */


struct TimseTable{
    let multiplier:Int
    subscript(index:Int) ->Int
    {
        return multiplier * index
    }
}

let threeTimesTable = TimseTable(multiplier: 3)

var numberOfLegs = [
    "Spider": 8,
    "ant":2,
    "cat":4
]

numberOfLegs["cat"]

