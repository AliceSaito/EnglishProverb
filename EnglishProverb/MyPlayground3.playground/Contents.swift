import UIKit

// 変数
// データを臨時で保存するあ器
// データを保存して加工したり他のオブジェクトに渡す
// 様々なデータタイプがある
// String, Int, Float, Array, Dictionary(key: value)


// let 変数名: タイプ = 値
// var 変数名: タイプ = 値 // 可変
// タイプは省略可能だがなるべく書いた方が良い
let str1 = "Hello, playground1"
var str2 = "Hello, playground2"
//str1 = "おはよう" // let 変数には値を再設定ができない
str2 = "おはよう☀️"


// String
// 文字列
let value1: String = "テスト"

// 数字形
// Int, Float, Double
let vaue2: Int = 123
let value3: Float = 1.1123131312312312312313131231231231231313123123123
let value4: Double = 0.1231313123123123


// 状況により扱う変数を決めて使わなければいけない
// 例） UILabel

let label1 = UILabel.init(frame: CGRect.zero)
label1.text = "안녕하세요😄"

// Array
// 複数のデータを積むやつ
// 定義する時保存したいデータ形を決める必要がある(95%)

let array1: [String] = ["1", "2", "3", "4", "5"]


// アプリの一覧用のデータを扱う時よく使う
// 簡単にサンプルを作ってみる


// ClassとObjectの概念
// プログラミングはある目的のためObjectという概念で



// 基本文法


// For
for value in array1 {
    
    
    print(value + "--Hello.")
}


// If, Else if, Else



// 復讐, 昨日Autolayoutを利用して実装してみる


let ageRanges = ["ALL"] + (18..<50).map({ "\($0)"})
print(ageRanges)

let array = ["1", "2", "3", "4"]

for value in array {
    print("value > \(value)")
}

array[0]
// Dictionary
// key value
let alice = [
    "name": "aiko",
    "age": "31",
    "livingIn": "Tokyo",
    ]

alice["name"]
alice["age"]
alice["livingIn"]

let proverbs = [
    "question_en": "Birds of a feather flock together.",
    "question_jp": "類は友を呼ぶ",
    "answer_a": "flock",
    "answer_b": "gather",
    "answer_c": "crowd",
    "explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"
]


proverbs["question_en"]
