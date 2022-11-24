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
