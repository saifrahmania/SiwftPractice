// Method Overriding
class Dog {
    func makeNoise(value: String) {
        print(value)
    }
}

// Override method in subclass
class Poodle: Dog {
    override func makeNoise(value: String) {
        print("The Value is: \(value)")
    }
}
let poppy = Poodle()
poppy.makeNoise(value: "Yip!")

// Override method in subclass2
class Poodle2: Dog {
    override func makeNoise(value: String) {
        print(value)
    }
}
let poppy2 = Poodle2()
poppy2.makeNoise(value: "Gheu Gheu!")
