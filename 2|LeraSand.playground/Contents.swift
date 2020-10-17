import UIKit
import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
func checkNumber(number: Int) {
    if number % 2 == 0 {
        print("\(number) is even")
    } else {
        print("\(number) isn't even")
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDividedByThree(number: Int) {
    if number % 3 == 0 {
        print("\(number) is divided by 3")
    } else {
        print("\(number) isn't divided by 3")
    }
}

// 3. Создать возрастающий массив из 100 чисел.
var newArray = [Int]()

for i in 0..<100 {
    newArray.append(i)
}
print("Array:\(newArray)")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var array = [Int]()
var index = 0

while array.count > 0 && index < array.count {
    if array[index] % 3 != 0 {
        array.remove(at: index)
        index -= 1
    }
    index += 1
}
print()

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacchiArray(array:[Int]) -> [Int] {
var newArray = array
    for i in 0...50 {
        if i < 2 {
            newArray.append(1)
        } else {
            newArray.append(newArray[i-1] + newArray[i-2])
        }
    }
    return newArray
}

var newFibonacchiArray = [Int]()
newFibonacchiArray = fibonacchiArray(array: newFibonacchiArray)

print("The last number in the Fibonacchi array is \(newFibonacchiArray[50])")
print("Full result of Fibonacchi array \(newFibonacchiArray)")

/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/

func prime(num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
func primeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    return results
}
print("Numbers of the array are \(primeArray())")

