import UIKit

var ありす = "Hello, playground"
ありす = "89"

let kim: Int = 2350
var kam: Float = 2.4

let gam: UILabel = UILabel.init()

gam.text

var array : Array<String> = ["こんにちは","ニーハオ","カムサハムニダ"]
array[0]

//for emi in array {
//
//    print(emi)
//}

//for v in array {
//    print(v + " 😊")
//}


if ありす == "88" {
    print("ok")
} else if ありす == "87" {
    print("87")
}  else if ありす == "86" {
    print("86")
}  else if ありす == "89" {
    print("89")
} else {
    print("NG")
}

class Aiko {
    var maru: String = "Small dog"
    let hachi: String = "Big dog"
    
    func choco(abc: String) -> (String, Int) {
        
        var str = abc + "です"
        
        return (str, 10)
    }
    
    func candy() {
        self.choco(abc: "Mozi")
    }
}

let aiko = Aiko.init()
print(aiko.choco(abc: "Mozi").1)

//class Model {
//
//    var a: String = ""
//    var b: Int = ""
//    var c: Float = ""
//    var d: Double = ""
//
//}

let arr: Array<String> = []
let arr2: [String] = []


// Func 練習
func add(value: Int) -> Int {
    
    let result = value + 1000
    
    return result
}

func sum(a: Int, b: Int) -> Int {
    
    return a + b
}

func test() {
    
    print("ありす🐜")
}

let result = add(value: 500)

let button = UIButton.init()


if result == 1500 {
    
    print("正解")
    // この
    
} else {
    
    print("不正解")
}


//print(result)
//test()

test()

let sumResult = sum(a: 100, b: 200)
print(sumResult)
