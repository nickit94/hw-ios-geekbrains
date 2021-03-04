import UIKit

/* 1. Решить квадратное уравнение. */

// ax^2 + bx + c = 0
let a:Double = 5
let b:Double = 7
let c:Double = 2
var x1:Double = 0
var x2:Double = 0

// Дискриминант
let discr:Double = pow(b, 2) - 4 * a * c

// В зависимости от значения дискриминанта вычисляем корни по-разному
if discr >= 0 {
    x1 = (-b + sqrt(discr)) / (2 * a)
    x2 = discr > 0
        ? ((-b - sqrt(discr)) / (2 * a))
        : x1
    
    print("x1 = \(x1)")
    print("x2 = \(x2)")
}
else {
    print("Корней нет :(")
}
