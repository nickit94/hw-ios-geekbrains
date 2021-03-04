import UIKit

/* 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет. */

var contrib:Double = 100000
let percent:Double = 6.9
let num_years:Int = 5

for _ in 1...num_years {
    contrib += contrib / Double(100) * percent;
}

print("Сумма вклада через \(num_years) лет: \(contrib)")


/* P.S. Не силен во вкладах, формулу делал, полагаясь на интуицию :)
 В онлайн-сервисах результат схожий. */
