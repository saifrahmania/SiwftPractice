class Person {

    var name = "Fahim Abir"

    init() {

        print("\\(name) is alive!")

    }

    

    deinit {

    print("The object is no more!")

    }

    func printGreeting() {

        print("Hello, I'm \\(name)")

    }

}

for _ in 1...3 {

    let person = Person()

    person.printGreeting()

}