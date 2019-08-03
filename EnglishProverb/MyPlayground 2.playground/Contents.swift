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

let proverb = [
    "question_en": "Birds of a feather flock together.",
    "question_jp": "類は友を呼ぶ",
    "answer_a": "flock",
    "answer_b": "gather",
    "answer_c": "crowd",
    "explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"
]


let proverbArray = [
    ["question_en": "Birds of a feather flock together.","question_jp": "類は友を呼ぶ", "answer_a": "flock","answer_b": "gather","answer_c": "crowd","explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"],
                    ["question_en": "The pen is mightier than the sword.","question_jp": "ペンは剣よりも強し", "answer_a": "mightier","answer_b": "stronger","answer_c": "powerful","explanation": "“sword”は剣、“mightier”は“might”（強靭な）の比較級ですから、直訳すると「ペンは剣よりも強靭である」ということになります。“pen”は、筆記用具のペンを指しているのではなく、ここでは言葉や言論のことを指しています。"],
                    ["question_en": "Time flies like an arrow.","question_jp": "光陰矢の如し", "answer_a": "flies","answer_b": "passes","answer_c": "runs","explanation": "「光陰矢のごとし」と同様、時間が経つのはとても早くて戻ってこないので、日々を大切にするべきという意味です。“arrow”は「矢」の意味ですから、「時間は矢のように飛ぶ」と直訳できますね。"],
                    ["question_en": "Fortune comes in at the merry gate.","question_jp": "笑う門には福来たる", "answer_a": "merry","answer_b": "cheerful","answer_c": "blithe","explanation": "「幸福は陽気な門からやってくる」という意味になります。“merry”は「陽気な・愉快な」の意味です。また、同じような意味のことわざに、“Laugh and be fat.”「笑って太りなさい」などもあります。"],
                    ["question_en": "Little and often fills the purse.","question_jp": "塵も積もれば山となる", "answer_a": "purse","answer_b": "pocket","answer_c": "wallet","explanation": "“fill”は「いっぱいにする・満たす」の意味です。日本のことわざでは「塵も積もれば山となる」のほか、「継続は力なり」も同じような意味だと言えます。"]
]


let proverbDic = proverbArray[2]

print(proverbDic)
print(proverbDic["question_en"] ?? "エラー")
print(proverbDic["answer_c"] ?? "エラー")
print(proverbDic["answer_a"]!)
print(proverbDic["answer_a"])

var optional: String! = nil

optional
