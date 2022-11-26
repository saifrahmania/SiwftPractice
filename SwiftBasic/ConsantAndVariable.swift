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



