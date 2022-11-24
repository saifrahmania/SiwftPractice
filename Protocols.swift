/*
        *PROTOCOLS*
 */

protocol SomeProtocol{
    var mustBeSetter :Int {get set}
    var doesNotNeedToBeSet: Int {get}
}
protocol AnotherProtocol{
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed{
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName: String
    
    
}

let john = Person(fullName: "John Smith")
print(john.fullName)

class Starship: FullyNamed{
    var name: String
    
    var prefix:String?
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix! +  " ": " ") + name
    }
}

var ncc1707 = Starship(name: "Enterprize", prefix: "USS")

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinerGhruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.4
    let a = 3877.0
    let c = 29537.0
    func random() -> Double {
        lastRandom = ((lastRandom * a+c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
}

let generator = LinerGhruentialGenerator()
print("A random number \(generator.random())")


class Dice{
    let sides: Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll()->Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinerGhruentialGenerator())
for _ in 1...5{
    print("Random dice roll : \(d6.roll())")
}


protocol Named{
    var name:String{get}
}
protocol Aged{
    var age: Int{get}
}
struct Person: Named,Aged{
    var name: String
    var age: Int
    
}

func wishHappyBirthday( _ celebrator :Named & Aged){
    print("Happy Birthday, \(celebrator.name), you are \(celebrator.age) !")
}

let birthdayPerson = Person(name: "Saifur", age: 24)
wishHappyBirthday(birthdayPerson)

class Location {
    var latitide:Double
    var longitude: Double
    init(latitude:Double, longitude: Double){
        self.latitide = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert( _ location : Location & Named){
    print("Hello, \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.6)
beginConcert(seattle)


protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea{
    let pi = 3.1415927
    var radius : Double
    var area :Double {return pi * radius * radius}
        init(radius:Double) {self.radius = radius}
}

class Country: HasArea{
    var area: Double
    init(area : Double) {self.area = area}
}

class Animal {
    var legs:Int
    init(legs: Int) {self.legs = legs}
    
}

let objects: [AnyObject] = [
    Circle(radius:2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea{
        print("Area is \(objectWithArea.area)")
    }
    else {
        print("Something that does not have any area ")
    }
}


protocol RandomNumberGenerator{
    func random() -> Double
}

extension RandomNumberGenerator{
    func randomBool() -> Bool {
        return random() > 0.5
        
    }
}

class LinerGhruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.4
    let a = 3877.0
    let c = 29537.0
    func random() -> Double {
        lastRandom = ((lastRandom * a+c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    
}

let generator = LinerGhruentialGenerator()
print("Random number : \(generator.random())")
print("Random Bool : \(generator.randomBool())")



extension Collection where Element:Equatable{
    func allEqual() -> Bool {
        for element in self{
            if element != self.first{
                return false
            }
        }
        return true
    }
}

let equalNumber  = [100,100,100,100]
let differentNumber = [100,100,200,100,200]
print(equalNumber.allEqual())
print(differentNumber.allEqual())
