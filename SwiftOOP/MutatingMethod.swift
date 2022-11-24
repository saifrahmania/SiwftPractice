/*
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

*/
/*
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
*/
/*
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
*/
/*
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
*/
/*
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()
var sq = SomeClass()
sq.someTypeMethod()
*/
/*
final class Dog{
    var name : String
    var breed : String
    init(name:String, breed: String){
        self.name = name 
        self.breed = breed
    }
}

*/
/*
struct Farenheit{
    var temparature: Int = 0
    init(new: Int){
        temparature = temparature + new
    }
    deinit{
        print("Lost the reference")
    }
}

var f = Farenheit(new)
print("The default temp \(f.temparature)")
for i in 1...3{
    f += Farenheit(new: i)
}
*/
/*
enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static 
    subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
    
}
let mars = Planet[4]
print(mars)
*/

let favoriteSnacks  = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func boyFavoriteSnacks(person: String, vendingMacine: vendingMacine){
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMacine.vend(itemNamed: snackName)
}

var vendingMachine = vendingMacine()
vendingMachine.coinsDeposited = 8
do{
    try boyFavoriteSnacks(person: "Alice", vendingMacine: vendingMachine)
    print("Success! Yum.")
}
catch vendingMacineError.invalidSelection{
    print("Invalid Selection.")
}
catch vendingMacineError.outOfStock{
    print("Out of Stock.")
}
catch vendingMacineError.insufficientFunds(let coinsNeeded){
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
catch{
    print("Unexpected error: \(error).")
}

func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}
