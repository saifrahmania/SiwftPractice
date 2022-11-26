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


