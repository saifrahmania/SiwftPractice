/*
let name = "John Appleseed"
var age = 15
age = 16
let latitude: Double = 36.166667
let longitude: Double = -86.783333
print("Your name is \(name) and you are \(age) years old.")
print("Your coordinates are \(latitude), \(longitude).")
let someString = """
This string starts
and ends with three double quotes.
"""
print(someString)
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}
var variableString = "Horse"
variableString += " and carriage"
*/
// Path: CollectionTypes.swift
/*
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print(shoppingList[1])

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)
var instruction = "look over"
instruction += string2
print(instruction)
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)
let badStart = """
one
two
"""
print(badStart)
*/
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
/*for character in shoppingList{
    print(character)
}*/
//print(shoppingList.count)
//print(shoppingList.isEmpty)
shoppingList.append("red paint")
//print(shoppingList)
shoppingList += ["blue paint", "yellow paint"]
//print(shoppingList[shoppingList.startIndex])
//print(shoppingList[shoppingList.index(before: shoppingList.endIndex)])
let index = shoppingList.index(shoppingList.startIndex, offsetBy: 2)
//print(index)
//print(shoppingList[index])

shoppingList.insert("red paint", at: shoppingList.endIndex)
/*for index in shoppingList.indices{
    print(shoppingList[index], terminator: ", ")
}*/
/*
shoppingList.remove(at: shoppingList.endIndex)
print(shoppingList.index(of: "red paint")!)
shoppingList.insert(contentOf: "there ", at:shoppingList.index(before: shoppingList.endIndex))
shoppingList.remove(at: shoppingList.index(before:shoppingList.endIndex))
let range  = shoppingList.index(shoppingList.endIndex,offsetBy: - 6)..<shoppingList.endIndex
shoppingList.removeSubrange(range)*/
/*
let quotation = "We are a lot alike, you and me"
let sameQuotation = "We are a lot alike, you and me"
if quotation == sameQuotation{
    print("Same")
}
else{
    print("Diferent")
}
*/

let romeoAndJuliet = [
"Act 1 Scene 1: Verona, A public place", "Act 1 Scene 2: Capulet's mansion",
"Act 1 Scene 3: A room in Capulet's mansion",
"Act 1 Scene 4: A street outside Capulet's mansion",
"Act 1 Scene 5: The Great Hall in Capulet's mansion",
"Act 2 Scene 1: Outside Capulet's mansion",
"Act 2 Scene 2: Capulet's orchard",
"Act 2 Scene 3: Outside Friar Lawrence's cell",
"Act 2 Scene 4: A street in Verona",
"Act 2 Scene 5: Capulet's mansion",
"Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
    act1SceneCount += 1
   }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
   if scene.hasSuffix("Capulet's mansion") {
       mansionCount += 1
   } else if scene.hasSuffix("Friar Lawrence's cell") {
       cellCount += 1
   }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
let orangesAreOrange = true
let applesAreBlue = false
/*
Boolean values are particularly useful when you work with conditional statements such as the if statement:
*/
if applesAreBlue {
   print("Apples are blue!")
} else {
print("Apples are not blue.")
}

let i = 1
if i{
    //this will create error as i is not boolean 
}

let i = 1
if i == 1 {
// this example will compile successfully
}

//Slide 29
let i = true
if i{
    // this block will work because it does have the buulean values
}


typealias AudioSample = UInt16
var minAmplitudeFound = AudioSample.min

var maxAmplitudeFound = AudioSample.max

let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"


9 % 4
-9 % 4
9 % -4
-9 % -4

var a = 1
a += 2
// a is now equal to 3

let b = 10
let c = 10
b == c
b != c
b > c
b >= c
b < c
b <= c

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

var threeDouble = [Double](repeating: 0.0, count: 3)
var anotherThreeDouble = Array(repeating: 2.5, count: 3)
var sixDouble = threeDouble + anotherThreeDouble
var array1: [Int] = [1, 2, 3]
var array2: [Int] = [4, 5, 6]
var array3 = array1 + array2
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList += ["Flour"]
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)") //this enumerate will give the index of the array given

}

var letters = Set<Character>()


//Slide 56
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."
letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
favoriteGenres.insert("Jazz")
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["duck", "rabbit"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
farmAnimals.isStrictSubset(of: cityAnimals)
cityAnimals.symmetricDifference(farmAnimals)
cityAnimals.union(farmAnimals)
cityAnimals.intersection(farmAnimals)
cityAnimals.subtracting(farmAnimals)
var nameOfIntegers: [Int: String] = [:]
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

let temparatureInFahrenheit = 30
if temparatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temparatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
case "z", "Z":
    print("The letter Z")
default:
    print("Not the letter A")
}


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings).")

let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_,0):
    print("\(somePoint) is on the x-axis")
case (0,_): 
    print("\(somePoint) is on the y-axis")
case (-2...2,-2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}

print(description)

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

var index = 10
repeat {
    print("index is \(index)")
    index += 1
} while index < 10

fancyLabel: for each in array{
    for each in array{
        if each == 1{
            break fancyLabel
        }
    }
}

anotherLabel: for each in array{
    for each in array{
        if each == 1{
            continue anotherLabel
        }
    }
}


switchLabel: switch someValue {
case 1:
    break switchLabel
default:
    break switchLabel
}


var index = 0
let number  = [1,4,6 25,17,8]
outlerLoop: while index < numbers.count{
    innerLoop: for number in numbers{
        switch number{
            case 25:
                continue innerLoop
            case 17:
                continue outlerLoop
            default:
                break
        }
        print(number)
    }
    index += 1
}

func greet(person: [String,String]) {
    guard let name = person ["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

enum Baverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Baverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Baverage.allCases {
    print(beverage)
}

enum Distance{
    case km(String)
    case m(String)
    case cm(String)
    case mm(String)

}
Distance.km("Metric System")
var dist1 = Distance,km("Metric System")
print(dist1)

var dist2 = Distance.miles("Imperial System")
print(dist2)

enum Marks{
    case gpa(Double,Double,Double)
    case grade(String,String,String)
}

var marks1 = Marks.gpa(3.6,2.9,3.8 )
print(marks1)

var marks2 = Marks.grade("A","B","C")
print(marks2)

enum Pizza{
    case small (inches: Int)
    case medium (inches: Int)
    case large (inches: Int)

}

var pizza1 = Pizza.small(inches: 12)
print(pizza1)

enum Mercedes{
    case sedan(height: Double)
    case suv(height: Double)
    case rodester(height: Double)

}

var choice  = Mercedes.sedan(height: 5.5)
switch(choice){
    case .sedan(let height):
        print("Height of sedan is \(height)")
    case .suv(let height):
        print("Height of suv is \(height)")
    case .rodester(let height):
        print("Height of rodester is \(height)")
}

//Slide 112

