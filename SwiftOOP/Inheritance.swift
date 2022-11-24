//Object Creation
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func printValues(){
        print("This is an example of Swift Inheritance")
        print(self.name)
        //print(self.breed)
    }
}
//let poppy = Dog(name: "Poppy", breed: "Poodle")

//Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
let poppy = Poodle(name: "Poppy")
poppy.printValues()
