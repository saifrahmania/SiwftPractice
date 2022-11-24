

    enum MyError: Error {
        case smallLength
        case largeLength
        case voidName
        case passwordMismatch
        case specialCharacter
        case nameTaken

    }

    class FormValidator{
        func validateCheck(userName:String, password:String, confirmPassword:String)throws {
            let userNameLength = userName.count
            let passwordLength = password.count
            for character in userName{
                if((character >= "a" && character <= "z" ) || (character >= "A" && character <= "Z") || (character >= "0" && character <= "9")){
                    continue 

                }
                else {
                    throw MyError.voidName
                }
            }
            if(userNameLength < 6){
                throw MyError.smallLength
            }
            if(userNameLength > 12){
                throw MyError.largeLength
            }
            if(password != confirmPassword){
                throw MyError.passwordMismatch
            }
            if(passwordLength < 8){
                throw MyError.smallLength
            }
            if(passwordLength > 16){
                throw MyError.largeLength
            }

            var smallChar:Bool = false
            var capitalChar:Bool = false
            var specialChar:Bool = false
            var number:Bool = false
            var space:Bool = false
            for character in password{
                if(character >= "a" && character <= "z"){
                    smallChar = true
                }
                else if(character >= "A" && character <= "Z"){
                    capitalChar = true
                }
                else if(character >= "0" && character <= "9"){
                    number = true
                }
                else if(character == " "){
                    space = true
                }
                else{
                    specialChar = true
                }
            }
            if(!smallChar){
                throw MyError.voidName
            }
            if(!capitalChar){
                throw MyError.voidName
            }
            if(!number){
                throw MyError.voidName
            }
            if(!specialChar){
                throw MyError.specialCharacter
            }
            if(space){
                throw MyError.voidName
            }
            if (password == confirmPassword){
                print("Password Matched")
            }
            else{
                throw MyError.passwordMismatch
            }


            
        }
    }

    var formValidator = FormValidator()
    do{
        try formValidator.validateCheck(userName: "Rahull", password: "Rahul@23", confirmPassword: "Rahul@123")
        print("Check Passed")
    }
    catch MyError.smallLength{
        print("Length is too small")
    }
    catch MyError.largeLength{
        print("Length is too large")
    }
    catch MyError.voidName{
        print("Name is void")
    }
    catch MyError.passwordMismatch{
        print("Password Mismatch")
    }
    catch MyError.specialCharacter{
        print("Password must contain special character")
    }
    catch MyError.nameTaken{
        print("Name is already taken")
    }






