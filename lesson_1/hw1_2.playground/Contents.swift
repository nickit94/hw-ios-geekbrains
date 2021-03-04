import UIKit

/* 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника. */

let a:Double = 3
let b:Double = 4

// Гипотенуза
let c:Double = sqrt(pow(a, 2) + pow(b, 2))

// Периметр
let perimeter:Double = a + b + c

// Площадь
let square:Double = (a * b) / 2

print("c = \(c)")
print("Perimeter = \(perimeter)")
print("Square = \(square)")
