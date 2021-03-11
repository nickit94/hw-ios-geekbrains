import UIKit

/* 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadBaggage(UInt)
    case unloadBaggage(UInt)
}


struct SportCar {
    let brand : String
    let model : String
    let yearIssue : UInt16
    let trunkVolume : UInt
    var isStartedEngine : Bool
    var isOpenWindows : Bool
    var filledVolumeTrunk : UInt {
        didSet {
            print("Текущий занятый объем багажника = \(self.filledVolumeTrunk)л,",
                  "места осталось: \(self.trunkVolume - self.filledVolumeTrunk)л")
        }
    }
    
    /* Конструктор */
    init(brand : String, model : String, yearIssue : UInt16, trunkVolume : UInt) {
        self.brand = brand
        self.model = model
        self.yearIssue = yearIssue
        self.trunkVolume = trunkVolume
        self.isStartedEngine = false
        self.isOpenWindows = false
        self.filledVolumeTrunk = 0
    }
    
    /* Действие с автомобилем */
    mutating func action(act : CarAction) {
        
        switch act {
        case .startEngine:
            if self.isStartedEngine {
                print("Двигатель уже запущен!")
                return
            }
            print("Запустили двигатель")
            self.isStartedEngine = true
            
        case .stopEngine:
            if !self.isStartedEngine {
                print("Двигатель уже заглушен!")
                return
            }
            print("Заглушили двигатель")
            self.isStartedEngine = false
            
        case .openWindows:
            if self.isOpenWindows {
                print("Окно уже открыто!")
                return
            }
            print("Открыли окно")
            self.isOpenWindows = true
            
        case .closeWindows:
            if !self.isOpenWindows {
                print("Окно уже закрыто!")
                return
            }
            print("Закрыли окно")
            self.isOpenWindows = false
            
        case .loadBaggage(let value):
            if self.filledVolumeTrunk + value > self.trunkVolume {
                print("Эта вещь не влезет в багажник")
                return
            }
            print("Загрузка в багажник \(value)л")
            self.filledVolumeTrunk += value
        
        case .unloadBaggage(let value):
            self.filledVolumeTrunk = (value <= self.filledVolumeTrunk) ? self.filledVolumeTrunk - value : 0
        }
    }
    
    func getFullModelName() -> String {
        return "\(brand) \(model)"
    }
}


struct TruckCar {
    let brand : String
    let model : String
    let yearIssue : UInt16
    var isStartedEngine : Bool
    var isOpenWindows : Bool
    let bodyVolume : UInt
    var filledVolumeBody : UInt {
        didSet {
            print("Текущий занятый объем кузова = \(self.filledVolumeBody) м3,",
                  "места осталось: \(self.bodyVolume - self.filledVolumeBody) м3")
        }
    }
    
    /* Конструктор */
    init(brand : String, model : String, yearIssue : UInt16, bodyVolume : UInt) {
        self.brand = brand
        self.model = model
        self.yearIssue = yearIssue
        self.bodyVolume = bodyVolume
        self.isStartedEngine = false
        self.isOpenWindows = false
        self.filledVolumeBody = 0
    }
    
    /* Действие с автомобилем */
    mutating func action(act : CarAction) {
        
        switch act {
        case .startEngine:
            if self.isStartedEngine {
                print("Двигатель уже запущен!")
                return
            }
            print("Запустили двигатель")
            self.isStartedEngine = true
            
        case .stopEngine:
            if !self.isStartedEngine {
                print("Двигатель уже заглушен!")
                return
            }
            print("Заглушили двигатель")
            self.isStartedEngine = false
            
        case .openWindows:
            if self.isOpenWindows {
                print("Окно уже открыто!")
                return
            }
            print("Открыли окно")
            self.isOpenWindows = true
            
        case .closeWindows:
            if !self.isOpenWindows {
                print("Окно уже закрыто!")
                return
            }
            print("Закрыли окно")
            self.isOpenWindows = false
            
        case .loadBaggage(let value):
            if self.filledVolumeBody + value > self.bodyVolume {
                print("Эта вещь не влезет в кузов")
                return
            }
            print("Загрузка в кузов \(value) м3")
            self.filledVolumeBody += value
        
        case .unloadBaggage(let value):
            self.filledVolumeBody = (value <= self.filledVolumeBody) ? self.filledVolumeBody - value : 0
        }
    }
    
    func getFullModelName() -> String {
        return "\(brand) \(model)"
    }
}


var car_1 = SportCar(brand: "Toyota", model: "Mark II", yearIssue: 1997, trunkVolume: 330)
print(car_1.getFullModelName())
car_1.action(act: .openWindows)
car_1.action(act: .openWindows)
car_1.action(act: .startEngine)
car_1.action(act: .loadBaggage(100))
car_1.action(act: .loadBaggage(270))

print("\n\n")

var car_2 = SportCar(brand: "Mazda", model: "RX-8", yearIssue: 2005, trunkVolume: 290)
print(car_2.getFullModelName())
car_2.action(act: .startEngine)
car_2.action(act: .startEngine)
car_2.action(act: .openWindows)
car_2.action(act: .stopEngine)
car_2.action(act: .loadBaggage(100))
car_2.action(act: .loadBaggage(270))

print("\n\n")

var truck_1 = TruckCar(brand: "Isuzu", model: "Elf", yearIssue: 2004, bodyVolume: 18)
print(truck_1.getFullModelName())
truck_1.action(act: .openWindows)
truck_1.action(act: .startEngine)
truck_1.action(act: .openWindows)
truck_1.action(act: .loadBaggage(4))
truck_1.action(act: .loadBaggage(10))
truck_1.action(act: .loadBaggage(6))
