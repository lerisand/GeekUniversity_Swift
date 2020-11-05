import UIKit

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

struct Users {
    let login: Login
    let password: Int
}

struct Login {
    let name: String
}

enum AuthorizationError: Error {
    case wrongPassword
    case wrongName
}

class Authorization {
    var dataUsers = [
        "Lera" : Users(login: Login(name: "Lera"), password: 1122),
        "Victor" : Users(login: Login(name: "Victor"), password: 1234),
        "Alexy" : Users(login: Login(name: "Alexy"), password: 0987)
    ]
    
    func login(name: String, password: Int) -> (Login?, AuthorizationError?) {
       
        guard let users = dataUsers[name] else {
            return (nil, .wrongName)
        }
        
        guard users.password == password else {
            return (nil, .wrongPassword)
        }
    
        return (users.login,nil)
    }
}

let user = Authorization()
let LeraTriesToLogIn = user.login(name: "Lera", password: 1122)

if let client = LeraTriesToLogIn.0 {
    print("Welcome, \(client.name)!")
} else if let error = LeraTriesToLogIn.1{
    print("Error: \(error.self)")
}


let VictorTriesToLogIn = user.login(name: "Victor", password: 1234)

if let client = VictorTriesToLogIn.0 {
    print("Welcome, \(client.name)!")
} else if let error = VictorTriesToLogIn.1{
    print("Error: \(error.self)")
}

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum ATMError: Error {
    case emptyATM
    case emptyBalanceOnTheCard
    case ATMLostConnectionWithTheServer
}

struct Balance {
    var moneyToWithdraw: Double
}

class ATM {
    private var moneyLeft: Double
    private var moneyInATM: Double
    private var serverConection: Bool
    
    func getMoney(moneyToWithdraw: Balance) throws {
        
        guard serverConection == true else {
            throw ATMError.ATMLostConnectionWithTheServer
        }
        
        guard moneyLeft >= moneyToWithdraw.moneyToWithdraw else {
            throw ATMError.emptyBalanceOnTheCard
        }
   
        guard moneyInATM >= moneyToWithdraw.moneyToWithdraw else {
            throw ATMError.emptyATM
        }
        
        moneyLeft = self.moneyLeft - moneyToWithdraw.moneyToWithdraw
        moneyInATM = self.moneyInATM - moneyToWithdraw.moneyToWithdraw
    }
    
    func getDescription(selectOperationNumber: Int) -> () {
        switch selectOperationNumber {
        case 1:
            return print("Avaliable amount on your card: \(moneyLeft)")
        case 2:
            return print("Avaliable amount in ATM: \(moneyInATM)")
        case 3:
            return print("Server conection: \(serverConection)")
        default:
            return print("""
                Wrong action!
                1 - check your balance,
                2 - check avaliable amount in ATM,
                3 - check conection status.
                """)
        }
    }
    

    init(moneyLeft: Double, moneyInATM: Double, serverConection: Bool) {
        self.moneyLeft = moneyLeft
        self.moneyInATM = moneyInATM
        self.serverConection = serverConection
    }
}

let operationFirst = ATM(moneyLeft: 100_000, moneyInATM: 50_000, serverConection: true)
    do {
        try operationFirst.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 50_000))
    } catch ATMError.emptyATM {
        print("This amount is currently unavaliable in ATM!")
    } catch ATMError.ATMLostConnectionWithTheServer {
        print("Conection with the server lost!")
    } catch ATMError.emptyBalanceOnTheCard {
        print("Not sufficient funds!")
    }
operationFirst.getDescription(selectOperationNumber: 1)
operationFirst.getDescription(selectOperationNumber: 2)
operationFirst.getDescription(selectOperationNumber: 3)

let operationTwo = ATM(moneyLeft: 1_000, moneyInATM: 2_000, serverConection: false)
    do {
        try operationTwo.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_000))
    } catch ATMError.emptyATM {
        print("This amount is currently unavaliable in ATM!")
    } catch ATMError.ATMLostConnectionWithTheServer {
        print("Conection with the server lost!")
    } catch ATMError.emptyBalanceOnTheCard {
        print("Not sufficient funds!")
    }
operationTwo.getDescription(selectOperationNumber: 1)
operationTwo.getDescription(selectOperationNumber: 2)
operationTwo.getDescription(selectOperationNumber: 3)

let operationThree = ATM(moneyLeft: 1_000, moneyInATM: 2_000, serverConection: true)
    do {
        try operationThree.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_500))
    } catch ATMError.emptyATM {
        print("This amount is currently unavaliable in ATM!")
    } catch ATMError.ATMLostConnectionWithTheServer {
        print("Conection with the server lost!")
    } catch ATMError.emptyBalanceOnTheCard {
        print("Not sufficient funds!")
    }
operationThree.getDescription(selectOperationNumber: 1)
operationThree.getDescription(selectOperationNumber: 2)
operationThree.getDescription(selectOperationNumber: 3)


let operationFour = ATM(moneyLeft: 1_000, moneyInATM: 500, serverConection: true)
    do {
        try operationFour.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_000))
    } catch ATMError.emptyATM {
        print("This amount is currently unavaliable in ATM!")
    } catch ATMError.ATMLostConnectionWithTheServer {
        print("Conection with the server lost!")
    } catch ATMError.emptyBalanceOnTheCard {
        print("Not sufficient funds!")
    }
operationFour.getDescription(selectOperationNumber: 1)
operationFour.getDescription(selectOperationNumber: 2)
operationFour.getDescription(selectOperationNumber: 3)
