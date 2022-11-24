/**
 
        *Generics*
 
 */

func swapTwoInts( _ a : inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}

func swapTwoValues<T>( _ a : inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 104
swapTwoValues(&someInt, &anotherInt)

var someString = "Hello"
var anotherString = "World"
swapTwoValues(&someString, &anotherString)

struct IntStack{
    var items:[Int] = []
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }
}

struct Stack <Element> {
    var items:[Element] = []
    mutating func push (_ item : Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var stackOfString  = Stack<String>()
stackOfString.push("ichi")
stackOfString.push("ni")
stackOfString.push("san")
stackOfString.pop()
extension Array: TextRepresentable where Element: TextRepresentable{
    var textualDescription:String { self.map{$0.textualDescription}
        return "[" + itemAsText.joined(separator: ", ") + "]"
    
    }
}

let myDice = [d6,d12]
print(myDice,textualDescription)


protocol Printer {
    associatedtype T
    func printing()
}


extension Printer where T : Collection {
    func printing1() {
        print("Depending on collection")
    }
}

extension Printer {
    func printing() {
        print("Not depending on collection")
    }
}


struct Runner<T> : Printer {
    var items: [T] = []
    
    init(_ items: [T]) {
        self.items = items
    }
    
    func printValues() {
        for item in items {
            print(item)
        }
        printing()
    }
}

var listoo: Set<Int> = [1,2,34,56,7,8]
var l1 = [1,2,34,56,7,8]
var numR = Runner<Int>(l1)
var lR = Runner<Set<Int>>([listoo,listoo])
numR.printValues()
lR.printing1()




var x = 5
var y = 10

swap(&x, &y)

func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
x
y




protocol P {
    func whatAmI()
}
extension P {
    func whatAmI() {
        print("protocol")
    }
}
class A: P {
    func whatAmI() {
        print("superclass")
    }
}
class B: A {
    override func whatAmI() {
        print("subclass")
    }
}
A().whatAmI()           // prints 'superclass'
B().whatAmI()           // prints 'subclass'
(B() as A).whatAmI()    // prints 'subclass'
// The upcast, going from a derived class to a base class, can be checked at compile time and will never fail.



/// The Problem That Generics Solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"


func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}



/// Generic Functions and Type Parameters

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/*
 func swapTwoInts(_ a: inout Int, _ b: inout Int)
 func swapTwoValues<T>(_ a: inout T, _ b: inout T)
 */


// In the two examples below, T is inferred to be Int and String respectively:
var someOtherInt = 3
var yetAnotherInt = 107
swapTwoValues(&someOtherInt, &yetAnotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"

// You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas.




/// Generic Types

// here is a nongeneric version of a stack. in this case, a stack of Int values:
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Here’s a generic version of the same code:
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
// return items.isEmpty ? nil : items[items.count - 1]


var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings


var stackOfInts = Stack<Int>()
stackOfInts.push(1)
stackOfInts.push(2)
stackOfInts.push(3)
stackOfInts.pop()
stackOfInts.push(4)
stackOfInts.push(5)
stackOfInts.items


/// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
// Prints "The top item on the stack is tres.if let topItem = stackOfStrings.topItem
// Prints "The top item on the stack is tres.

var s = Stack<Int>()
// s.topItem = 5 // error! Cannot assign to property: 'topItem' is a get-only property



/// Type Constraints
/* type constraint syntax
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
*/

// Type Constraints in Action
// consider the nongeneric function below that works with strings only
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// Prints "The index of llama is 2"


// let's implement a generic version
/*
 // the following code will give an error during compile time
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { // error!
            return index
        }
    }
    return nil
}
*/


// solving the issue with == operator using Equatable protocol constraint

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2



/// Associated Types

// using our prior knowledge of Generics, can we define a generic protocol as shown below?
/*
protocol StackProtocol<Element> { // error!
    var items: [Element] { get set }
    mutating func push(_ item: Element)
    mutating func pop() -> Element
}
extension StackProtocol {
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
*/

// fixing the issue in the code snippet above with associatedtype

protocol StackProtocol{
    associatedtype Element
    var items: [Element] { get set }
    mutating func push(_ item: Element)
    mutating func pop() -> Element
}
extension StackProtocol {
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


struct NewStack: StackProtocol { // by conforming to the StackProtocol
    typealias Element = Int
    var items: [Element] = []
}

var newStack = NewStack()
newStack.push(1)
newStack.push(2)
newStack.push(3)
newStack.pop()
newStack.push(4)
newStack.push(5)
newStack.pop()
newStack.items


struct NewStack2<T>: StackProtocol {
    typealias Element = T
    var items: [Element] = []
}
var ss1 = NewStack2<Int>()
ss1.push(3)
ss1.pop()
ss1.push(4)
ss1.items

enum SomeEnum {
    case a(Int)
    case b(String)
}

extension StackProtocol where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

enum SomeEquatableEnum: Equatable {
    case a(Int)
    case b(String)
}

var anotherEnumStack = NewStack2<SomeEnum>()
let c1 = SomeEnum.a(1)
let c2 = SomeEnum.b("b")
anotherEnumStack.push(c1)
anotherEnumStack.push(c2)
anotherEnumStack.pop()
anotherEnumStack.push(c1)
anotherEnumStack.push(c2)
anotherEnumStack.items
// anotherEnumStack.isTop // error! Referencing instance method 'isTop' on 'StackProtocol' requires that 'NewStack2<SomeEnum>.Element' (aka 'SomeEnum') conform to 'Equatable'



let e1 = SomeEquatableEnum.a(1)
let e2 = SomeEquatableEnum.b("b")
var equatableEnumStack = NewStack2<SomeEquatableEnum>()
equatableEnumStack.push(e1)
equatableEnumStack.push(e2)
equatableEnumStack.pop()
equatableEnumStack.push(e1)
equatableEnumStack.push(e2)
equatableEnumStack.items
equatableEnumStack.isTop // no error since SomeEquatableEnum conforms to Equatable


var anotherIntStack = NewStack2<Int>()
anotherIntStack.push(1)
anotherIntStack.push(2)
anotherIntStack.push(3)
anotherIntStack.push(4)
anotherIntStack.pop()
anotherIntStack.push(5)
anotherIntStack.push(6)
anotherIntStack.items
anotherIntStack.isTop(5)
anotherIntStack.isTop(6)
anotherIntStack.isTop(2)




protocol Container {
    associatedtype Item
    var items: [Item] { get set }
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

extension Container {
    var items: [Item] {
        return []
    }
    mutating func append(_ item: Item) {
        items.append(item)
    }
}

/*
 struct IntStack: Container {
 // original IntStack implementation
 var items: [Int] = []
 mutating func push(_ item: Int) {
 items.append(item)
 }
 mutating func pop() -> Int {
 return items.removeLast()
 }
 // conformance to the Container protocol
 typealias Item = Int
 mutating func append(_ item: Int) {
 self.push(item)
 }
 var count: Int {
 return items.count
 }
 subscript(i: Int) -> Int {
 return items[i]
 }
 }
 
 
 // You can also make the generic Stack type conform to the Container protocol:
 
 struct Stack<Element>: Container {
 // original Stack<Element> implementation
 var items: [Element] = []
 mutating func push(_ item: Element) {
 items.append(item)
 }
 mutating func pop() -> Element {
 return items.removeLast()
 }
 // conformance to the Container protocol
 mutating func append(_ item: Element) {
 self.push(item)
 }
 var count: Int {
 return items.count
 }
 subscript(i: Int) -> Element {
 return items[i]
 }
 }
 
 
 // Adding Constraints to an Associated Type
 
 protocol AnotherContainer {
 associatedtype Item: Equatable
 mutating func append(_ item: Item)
 var count: Int { get }
 subscript(i: Int) -> Item { get }
 }
 
 */


/*
 
 protocol Container {
     associatedtype Item: Equatable
     mutating func append(_ item: Item)
     var count: Int { get }
     subscript(i: Int) -> Item { get }
 }

 func allItemsMatch<C1: Container, C2: Container>
     (_ someContainer: C1, _ anotherContainer: C2) -> Bool
     where C1.Item == C2.Item, C1.Item: Equatable {

         // Check that both containers contain the same number of items.
         if someContainer.count != anotherContainer.count {
             return false
         }

         // Check each pair of items to see if they're equivalent.
         for i in 0..<someContainer.count {
             if someContainer[i] != anotherContainer[i] {
                 return false
             }
         }

         // All items match, so return true.
         return true
 }
*/



