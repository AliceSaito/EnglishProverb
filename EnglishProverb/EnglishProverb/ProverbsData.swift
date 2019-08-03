//
//  ProverbsDate.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/20.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import Foundation

let proverbs: Array<Dictionary<String,String>> = [
    ["question_en": "A rolling stone gathers no moss.","number": "1" ,"question_jp": "転石、苔を生ぜず", "answer_a": "gathers","answer_b": "keeps","answer_c": "grows","correct": "gathers","explanation": "\"a rolling stone\"は職業や住居をよく変える人のことを指します。悪い意味なのに、なんだかカッコいいですよね。\"moss\"「苔」は成功や出世を比喩しています。\"gather\"は他動詞「～を集める」。"],
    ["question_en": "A hedge between keeps friendship green.","number": "2" ,"question_jp": "親しき仲にも礼儀あり", "answer_a": "green","answer_b": "bright","answer_c": "fresh","correct": "green","explanation": "\"keep green\"は「生き生きと保つ」、また\"hedge\"は「垣根」を意味します。副詞\"between\"と\"green\"が韻を踏んでいますね。"],
    ["question_en": "The early bird catches a worm.","number": "3" ,"question_jp": "早起きは三文の徳", "answer_a": "bird","answer_b": "squirrel","answer_c": "cat","correct": "bird","explanation": "\"early bird\"は「朝が早い人、物事を早くする人」の意味で使われます。たとえば\"early bird registration\"といえば、国際会議などに参加する場合の「早期の参加登録」を指します。早めに登録すると参加費が安くなるみたいですよ。"],
    ["question_en": "Don’t teach your grandmother to suck eggs.","number": "4" ,"question_jp": "釈迦に説法", "answer_a": "grandmother","answer_b": "daughter","answer_c": "mouth","correct": "grandmother","explanation": "\"suck\"は「吸う」なので、直訳は「祖母に卵の吸い方を教えるな」となります。独特の言い回しなので、頭に「？」が浮かんだ人もいらっしゃるかもしれませんね。\"apace\"は副詞で「たちまち」という意味です。"],
    ["question_en": "There is no time like the present.","number": "5" ,"question_jp": "思い立ったが吉日", "answer_a": "present","answer_b": "moment","answer_c": "matter","correct": "present","explanation": "「今のような時間はもうない」、つまり「今でしょ！」と言いたい時のフレーズです。the presentは「今，現在」の意味です。"],
//    ["question_en": "The pen is mightier than the sword.","number": "6" ,"question_jp": "ペンは剣よりも強し", "answer_a": "mightier","answer_b": "stronger","answer_c": "powerful","correct": "mightier","explanation": "\"mightier\"は\"might\"「強靭な」の比較級。直訳すると「ペンは剣よりも強靭である」となります。 慶應義塾のあのマークですね。ここでの\"pen\"は筆記用具ではなく、「言葉、言論」を指します。"],
//    ["question_en": "There's no accounting for taste.","number": "7" ,"question_jp": "たで食う虫も好きずき。", "answer_a": "accounting","answer_b": "proving","answer_c": "helping","correct": "accounting","explanation": "名詞で「計算、預金口座」などを意味する\"account\"は、動詞だと「説明する」になります。「人の好みは分からないもんだ」「あいつ、趣味悪いな」という感じで使われるフレーズです。"],
//    ["question_en": "Every dog has its day.","number": "8" ,"question_jp": "誰にでもチャンスはある", "answer_a": "its","answer_b": "their","answer_c": "his","correct": "its","explanation": "「どの犬にも自分の日がある」となり、「自分の日」＝「最盛期」を意味しています。「誰にでも必ず最盛期がある」「何か成功の機会がある」ということです。犬には失礼かもしれませんが、ここでいう犬、つまり\"its\"は最も低い身分を表しています。"],
//    ["question_en": "Little and often fills the purse.","number": "9" ,"question_jp": "塵も積もれば山となる", "answer_a": "purse","answer_b": "pocket","answer_c": "wallet","correct": "purse","explanation": "\"fill\"は「いっぱいにする・満たす」の意味。日本のことわざでは「継続は力なり」も同じような意味だと言えます。こつこつ少しずつ頑張りましょう。"],
//    ["question_en": "Fortune comes in at the merry gate.","number": "10" ,"question_jp": "笑う門には福来たる", "answer_a": "merry","answer_b": "cheerful","answer_c": "blithe","correct": "merry","explanation": "直訳は「幸福は陽気な門からやってくる」です。\"merry\"は「陽気な・愉快な」の意味。また、同じような意味のことわざに\"Laugh and be fat.\"「笑って太りなさい」があります。独特な表現ですね。"],
//    ["question_en": "He that falls today may rise tomorrow.","number": "11" ,"question_jp": "七転び八起き", "answer_a": "rise","answer_b": "lay","answer_c": "lie","correct": "rise","explanation": "\"lay\"は他動詞で「横にする」、\"lie\"は自動詞で「横になる」の意。\"rise\"は自分が上がるときに使う自動詞で、他動詞は\"raise\"でしたね。Heのあとに関係代名詞\"that\"が来るとなんだか変な感じしますよね。"],
//    ["question_en": "It’s no use crying over spilt milk.","number": "12" ,"question_jp": "覆水盆にかえらず", "answer_a": "use","answer_b": "work","answer_c": "time","correct": "use","explanation": "\"It’s no use ～ing\"で「ムダ」という意味になります。\"cry over ～\"は「～を嘆く」、\"spilt\"は動詞spillの過去・過去分詞形ですね。日本では水ですが、アメリカでは牛乳です。"],
//    ["question_en": "Example is better than precept.","number": "13" ,"question_jp": "論より証拠", "answer_a": "precept","answer_b": "theory","answer_c": "explanation","correct": "precept","explanation": "\"precept\"は「教訓、戒め」という意味ですので、直訳は「手本は教訓に勝る」という意味になります。百聞は一見にしかず。書を捨てよ、町へ出よう。"],
//    ["question_en": "You can’t tell a book by its cover.","number": "14" ,"question_jp": "人は見かけによらぬもの", "answer_a": "cover","answer_b": "title","answer_c": "looks","correct": "cover","explanation": "日本語でいう「ブックカバー」では本を包む覆いのことを指しますが、英語で\"book cover\"ときたら「本の表紙」のことです。 人も本も見た目ではなく中身が重要です。"],
//    ["question_en": "The end justifies the means.","number": "15" ,"question_jp": "嘘も方便", "answer_a": "end","answer_b": "will","answer_c": "mouth","correct": "end","explanation": "ここでの\"end\"は「目的」、meansは「手段、方法」を意味する名詞です。日本語訳は「目的が手段を正当化する」となり、嘘というフレーズは出てきません。嘘はダメです。"],
//    ["question_en": "He who touches pitch will be defiled.","number": "16" ,"question_jp": "朱に交われば赤くなる", "answer_a": "defiled","answer_b": "connected","answer_c": "friends","correct": "defiled","explanation": "直訳は「ピッチに触れる者は汚れる」です。\"pitch\"は動詞だと「～を投げる」ですが、石油を蒸留したあとに残る黒色の物質のことを\"pitch\"というそうです。日本語でも聞いたことないですよね。\"defile\"は「汚す」。"],
//    ["question_en": "Look before you leap.","number": "17" ,"question_jp": "転ばぬ先の杖", "answer_a": "leap","answer_b": "fall","answer_c": "touch","correct": "leap","explanation": "直訳すると「跳ぶ前に見よ」、つまり「行動を起こすには、用心の上に用心を重ねて行うべきである」という意味になります。飛ぶので杖は使いません。「石橋を叩いて渡る」が同じ英訳をされることも。"],
//    ["question_en": "Ill weeds grow apace.","number": "18" ,"question_jp": "憎まれっ子世にはばかる", "answer_a": "weeds","answer_b": "news","answer_c": "kids","correct": "weeds","explanation": "\"Ill\"は頭文字が大文字なので一瞬「３」かと思いますが、よく見ると「病気、不幸、悪」の意味をもつ\"ill\"です。ちなみに、\"ill news\"で「悪い知らせ」という表現もされます。"],
//    ["question_en": "Absence makes the heart grow fonder.","number": "19" ,"question_jp": "会えない時間が愛を育てる", "answer_a": "fonder","answer_b": "hotter","answer_c": "stronger","correct": "fonder","explanation": "\"fonder\" は\"fond\"「～を好んで」の比較級。\"be fond of ～ \"「～が好き」という表現でよく使われます。\"like\"よりも愛情のこもった好き、長い付き合いで親しみを感じている好きを表します。"],
//    ["question_en": "Custom makes all things easy.","number": "20" ,"question_jp": "習うより慣れろ", "answer_a": "Custom","answer_b": "Habit","answer_c": "Practice","correct": "Custom","explanation": "\"custom\"には「顧客、関税」以外に「習慣、風習」という意味もあります。同じ意味のことわざに\"Practice makes perfect.\"という表現も。こつこつ頑張るのは世界共通ですね。"],
//    ["question_en": "If you chase two rabbits, you will not catch either.","number": "21" ,"question_jp": "二兎を追う者は一兎も得ず", "answer_a": "either","answer_b": "any","answer_c": "both","correct": "either","explanation": "\"either\"は2つのものの中から1つを選び出して「どちらか、どちらでも」と言いたいときに使います。\"any \"は対象となる事柄が3つ以上の場合に使用します。"],
//    ["question_en": "So many men, so many minds.","number": "22" ,"question_jp": "十人十色", "answer_a": "minds","answer_b": "colors","answer_c": "feet","correct": "minds","explanation": "たくさんの人がいれば、それだけたくさんの心がある。非常にシンプルですね。似たものに\"One man's meat is another man's poison\"という表現も。ちなみに、\"feet\"は\"foot\"「足」の複数形です。"],
//    ["question_en": "Time flies like an arrow.","number": "23" ,"question_jp": "光陰矢の如し", "answer_a": "flies","answer_b": "passes","answer_c": "runs","correct": "flies","explanation": "時間が経つのはとても早くて戻ってこないので、日々を大切にするべきという意味です。\"arrow\"は「矢」の意味ですから、「時間は矢のように飛ぶ」と直訳できますね。"],
//    ["question_en": "Tomorrow is another day.","number": "24" ,"question_jp": "明日は明日の風が吹く", "answer_a": "another","answer_b": "other","answer_c": "one","correct": "another","explanation": "\"other\" も \"another\" も日本語にすると「他のもの」と訳されるので区別しにくいですよね。\"day\"のように３つ以上あるものの中から１つを指す場合は \"another\"を使いましょう。"],
//    ["question_en": "Birds of a feather flock together.","number": "25" ,"question_jp": "類は友を呼ぶ", "answer_a": "flock","answer_b": "gather","answer_c": "crowd","correct": "flock","explanation": "\"a feather\"は一つの羽・同じ羽を意味し、\"flock\"は「群がる」の意味。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味になります。"],
]


var proverbModelArr: Array<ProverbModel> = []

class ProverbModel {
    var questionEn : String = ""
    var questionJp : String = ""
    var answers : Array<String> = []
//  var answer_a : String = ""
//  var answer_b : String = ""
//  var answer_c : String = ""
    var correct : String = ""
    var explanation : String = ""
    var number : String = ""
}
