import UIKit
import Foundation

// 1 задание
// Equation = a(x^2) + bx + c

let a:Double = 14
let b:Double = 18
let c:Double = 10

let discriminant:Double = pow(b, 2)-4*a*c
print("Дискриминант равен \(discriminant)")

if (discriminant<0) {
   print("Корней нет")
    } else if (discriminant>0) {
        print("Корней будет два")
        let radicalOne = (-1 * b + sqrt(discriminant)) / 2 * a
        let radicalTwo = (-1 * b - sqrt(discriminant)) / 2 * a
            print("Первый корень \(radicalOne)")
            print("Второй корень \(radicalTwo)")
    } else {
        print("Есть ровно один корень")
            let x = (-1*b)/2*a
                print("Корень уравнения \(x)")
}


// 2

let katetA:Double = 6
let katetB:Double = 9

let area = (katetA * katetB) / 2.0
let hypotenuseC = sqrt((katetA * katetA) + (katetB * katetB))
let perimeter = (katetB + katetA) + hypotenuseC

print("Площадь треугольника = \(area), периметр треугольника = \(perimeter), длина гипотенузы треугольника = \(hypotenuseC)")



// 3

let years:Int = 5
print("Вычислим сумму вклада через \(years) лет")

var deposit:Double = 15000 //сумма депозита
let percent:Double = 8.5 //процент под который удержан вклад
print("Вы указали сумму вклада: \(deposit)")
print("Вы указали процентную ставку: \(percent)%")

let deposinPrimordial = deposit
var depositFinal = deposit

for i in 1...years {
    depositFinal = (deposit * (percent*0.01)) + deposit
    print("Размер вклада за \(i) год: \(NSString(format: "%.2f", depositFinal)) ")
    deposit = depositFinal
}

print("Сумма вклада увеличилась с \(deposinPrimordial) до \(NSString(format: "%.2f", depositFinal))")
let profit = depositFinal - deposinPrimordial
print("Прибыль составила \(NSString(format: "%.2f", profit))")
