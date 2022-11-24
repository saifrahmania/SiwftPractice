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

class Media {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: Media {
    private(set) var releaseYear: Int // private setter; i.e. we can get the value from outside the class' scope but cannot set it once it is initialized
    var director: String
    init(name: String, director: String, releaseYear: Int) {
        self.director = director
        self.releaseYear = releaseYear
        super.init(name: name)
    }
}

let mov1 = Movie(name: "mov1", director: "mov1d1", releaseYear: 2020)
// mov1.releaseYear = 2017 //Cannot assign to property: 'releaseYear' setter is inaccessible

class Song: Media {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// Type Casting

let o1 = Movie(name: "abc", director: "def", releaseYear: 2011) // through type inference, type of o1 is Movie
let o11: Media = o1 // upcasting; type of o11 is Media
let o2 = o11 as? Movie // downcasting; type of o2 is Optional Movie (i.e. Movie?)

var o12: Any = Movie(name: "abc", director: "def", releaseYear: 2012)
o12 = o12 as! Media
type(of: o12)

if o12 is Media { // true
    print("media")
}
if o12 is Movie{ // true
    print("movie")
}
if o12 is Song{ // false
    print("song")
}

let o3 = Song(name: "song1", artist: "artist1")
let o4: Media? = o3

let o5 = o4 as? Song
o5?.artist

let o6 = o4 as? Movie

if let o6 = o6 {
    o6.director
}


let m1 = Movie(name: "m1", director: "m1d1", releaseYear: 2019)
let m2 = Movie(name: "m2", director: "m2d1", releaseYear: 2018)

let s1 = Song(name: "s1", artist: "s1a1")
let s2 = Song(name: "s2", artist: "s2a2")

var mediaLib = [Media]()
mediaLib.append(m1)
mediaLib.append(s1)

mediaLib[0].name
// mediaLib[0].director //error: Value of type 'Media' has no member 'director'

for item in mediaLib {
    if item is Movie {
        let movie = item as! Movie
        print("\(movie.director)")
    } else if item is Song {
        let song = item as! Song
        print("\(song.artist)")
    }
}

for item in mediaLib {
    if let movie = item as? Movie {
        print("\(movie.director)")
    } else if let song = item as? Song {
        print("\(song.artist)")
    }
}


/// Protocol

class Person: Identifiable {
    var id: String
    var name: String
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    func getId() -> String {
        return "person \(id)"
    }
}
class Student: Identifiable {
    internal var id: String
    var name: String
    var dept: String
    init(name: String, dept: String, id: String) {
        self.name = name
        self.dept = dept
        self.id = id
    }
}
protocol Identifiable {
    var id: String { get }
    func getId() -> String
}

extension Identifiable {
    func getId() -> String {
        return id
    }
}

var p31 = Person(name: "abc", id: "ryrt")
print("\(p31.getId())")

p31.id = "456"
print("\(p31.id)")

let s11 = Student(name: "bffs", dept: "aefse", id: "456")

print("\(s11.getId())")


let p112: Identifiable
//p1.id = "123" // Cannot assign to property: 'id' is a get-only property

let p1 = Person(name: "Bill", id: "458")
p1.name




// Protocol

protocol Payable {
    var hourlyWage: Double {get set}
    var workedHours: Double {get set}
    func calculateWages() -> Double
}


// Protocol conformance
/// Person2 conforms to the Payable Protocol
class Person2: Payable {
    var hourlyWage: Double
    var workedHours: Double
    
    init(hourlyWage: Double, workedHours: Double) {
        self.hourlyWage = hourlyWage
        self.workedHours = workedHours
    }
    
    func calculateWages() -> Double {
        return hourlyWage * workedHours
    }
}


/// Protocol inheritance

protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation { }

class Person3: Employee {
    var hourlyWage: Double
    var workedHours: Double
    
    init(hourlyWage: Double, workedHours: Double) {
        self.hourlyWage = hourlyWage
        self.workedHours = workedHours
    }
    
    func calculateWages() -> Double {
        return 10.0
    }
    
    func study() {
        print("studying...")
    }
    
    func takeVacation(days: Int) {
        print("take a vacation of \(days) days")
    }
}



// extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()



/// Protocol extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])


// Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly
extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()



/// POP

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable2 {
    var id: String
}

let u2 = User(id: "123")
u2.identify()

class User4: Identifiable2 {
    var id: String
    init(id: String){
        self.id = id
    }
}
let u4 = User4(id: "123")
u2.identify()

/// init


protocol TextDescription {
    var name: String { get set }
    func description()
}
extension Hamster: TextDescription {
    func description() {
        print("A hamster named \(name)")
    }
}

class Hamster {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var ham1 = Hamster(name: "Gerbil")
ham1.description()




protocol Employed {
    func getSalary() -> Double
    func commonFunc() -> String
}
extension Employed {
    func getId() -> Int {
        return 123
    }
    func commonFunc() -> String {
        return "common string"
    }
}

protocol Identifiable {
    func getId() -> String
    func commonFunc() -> Int
}
extension Identifiable {
    func getId() -> String {
        return "Id"
    }
    func commonFunc() -> Int {
        return 123456
    }
}

class Person1: Employed {
    func getSalary() -> Double {
        return 1
    }
}

class Person2: Identifiable {
    func getId() -> String {
        return "123"
    }
}

class Person3: Employed, Identifiable {
    func getSalary() -> Double {
        return 1
    }
    func getId() -> String {
        return "Id person"
    }
}

var o1 = Person3()
var resStr: String = o1.commonFunc() // output: "common string"
var resInt: Int = o1.commonFunc() // output: 123456

let p11 = Person1()
let p12 = Person2()
let p13 = Person3()

var arr: [AnyObject] = []
arr.append(p11)
arr.append(p12)
arr.append(p13)

func printDesc(for: Employed & Identifiable) {
    print("hello")
}

printDesc(for: p13)
// printDesc(for: p12) // error! Argument type 'Person2' does not conform to expected type 'Employed'
// printDesc(for: p11) // error! Argument type 'Person1' does not conform to expected type 'Identifiable'

for item in arr {
    if let item = item as? Employed & Identifiable {
        printDesc(for: item)
    } else if let item = item as? Identifiable {
        print(item.getId())
    } else if let item = item as? Employed {
        print(item.getSalary())
    }
}


protocol DrawProtocol {
    func draw() -> String
}
protocol SomeProtocol {
    var num: Int {get set}
    init(num: Int)
}

class DrawingStyle1: DrawProtocol, SomeProtocol {
    var num: Int
    required init(num: Int) {
        self.num = num
    }
    init() {
        self.num = 70
    }
    func draw() -> String {
        return "Style 1"
    }
}

class DrawingStyle2: DrawProtocol {
    func draw() -> String {
        return "Style 2"
    }
}

class Painter {
    var style: DrawProtocol
    init(style: DrawProtocol){
        self.style = style
    }
}

var o2 = Painter(style: DrawingStyle1())
if let style = o2.style as? SomeProtocol {
    style.num
}



let d1 = DrawingStyle1(num: 56)
let d2 = DrawingStyle2()
var p1 = Painter(style: d1)
p1.style = d2

p1.style.draw()
p1.style.draw()


p1.style = d1
if let style = p1.style as? DrawingStyle1 {
    style.draw()
}



class SomeClass: SomeProtocol {
    var num: Int
    required init(num: Int) {
        self.num = num
    }
}

class SomeOtherClass: SomeClass {
    init() {
        super.init(num: 65)
    }
    required init(num: Int) {
        super.init(num: num)
    }
}
var o123 = SomeOtherClass(num: 123)
o123.num // value of num is 123
o123 = SomeOtherClass()
o123.num // value of num is 65 by default

// The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.



// mutating functions in protocol
// when the function needs to modify self
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.toggle()
lightSwitch.toggle()


/// Protocol inheritence
protocol A {
    func a()
}

protocol B {
    func b()
}

protocol C {
    func c()
}


protocol LetterProtocols: A, B, C { }

extension LetterProtocols {
    func a() {
        print("a")
    }
}

class AnotherClass: LetterProtocols {
    // no need to implement a()
    func b() {
        
    }
    func c() {
        
    }
}

class YetAnotherClass: A {
    func a() {
        
    }
}


