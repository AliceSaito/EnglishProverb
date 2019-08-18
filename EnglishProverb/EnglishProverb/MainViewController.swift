//
//  MainViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/18.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

//UIビューコントローラーを生成するときに自動的につく
import UIKit

//最初に開くページ。最初は再テストボタンは隠されている、２回目以降表示
class MainViewController: UIViewController {
    
//    「間違った問題だけふ復習」ボタン
    @IBOutlet weak var repeatButton: UIButton!
//    熊のアニメーションを表示する
    @IBOutlet weak var kumaImageView: UIImageView!
    
    // ビューが初めて表示される時、このファンクションが呼び出される
    override func viewDidLoad() {
//        サブクラスがもっている変数、ファンクションを見るときsuperを使う
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //くまの背景を透明にする処理。ストーリーボードでもできる。
        kumaImageView.backgroundColor = UIColor.clear
        
        // くまのアニメーション処理
        kumaImageView.animationImages = [UIImage.init(named: "kiss00")!,UIImage.init(named: "kiss01")!,UIImage.init(named: "kiss02")!,UIImage.init(named: "kiss03")!,UIImage.init(named: "kiss04")!,UIImage.init(named: "kiss05")!,UIImage.init(named: "kiss06")!]
        
//        アニメーションの最後に表示させたいイメージを設定
        kumaImageView.image = UIImage.init(named: "kiss06")
        
//       アニメーションの速さ。３秒で７枚の絵を表示。
        kumaImageView.animationDuration = 3
        kumaImageView.animationRepeatCount = 1
//      アニメーションが動き出すタイミングを設定。上記の設定が終わったらすぐに動く。
        kumaImageView.startAnimating()
        
        /*
         ["question_en": "Birds of a feather flock together.",
         "question_jp": "類は友を呼ぶ",
         "answer_a": "flock",
         "answer_b": "gather","answer_c": "crowd","correct": "flock",
         "explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"],
         */
        
//          for文を使ってkotowazaという変数でproverbsというArrayの中を見る
//        proverbのArrayの中にはdictonaryがたくさん入っている。
//        dictonaryはkeyとvalueの形式でデータを保存する
        proverbModelArr = []
        for kotowaza in proverbs {
            print(kotowaza)
            
//          initはクラス(たい焼きの焼型)からオブジェクト(たい焼き)を生成するために使うファンクション
            let choco = ProverbModel.init()
//          key＝"question_en"を使って、value＝"Birds of a feather flock together."を取得する
            choco.questionEn = kotowaza["question_en"] ?? ""
            choco.questionJp = kotowaza["question_jp"] ?? ""
            choco.number = kotowaza["number"] ?? ""
            choco.answers = [
                kotowaza["answer_a"] ?? "",
                kotowaza["answer_b"] ?? "",
                kotowaza["answer_c"] ?? "",
            ]
            
            choco.explanation = kotowaza["explanation"] ?? ""
            choco.correct  = kotowaza["correct"] ?? ""
//           変数chocoを使って空のproverbModelArrに全25問を追加する
            proverbModelArr.append(choco)
        }
        
// 再テストのときに、UserDefaultsに保存した不正解のnumberの数が０より多いとき、隠れていた「間違えた問題だけ復習」ボタンを表示する
        if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<String> {
            
             if incorrectArr.count > 0 {
                
                repeatButton.isHidden = false
            }
            else if incorrectArr.count < 1 {
                
                repeatButton.isHidden = true
                
            }
        }
    }
    
    // MainViewControllerからQuestionViewControllerに移動する直前、QuestionViewControllerに変数を渡すため（分岐処理:if else）
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? QuestionViewController
        
//       「スタート」ボタンが押された場合
        if segue.identifier == "startButtonSegue" {
            
//          vc＝QuestionViewController
//            index0=問１から表示する
            vc?.questionIndex = 0
            //QuestionViewControllerにproverbModelArrを使ってくださいと指示する
            vc?.questionPageModel = proverbModelArr[0]
            
            //AnswerViewControllerで、次の問題画面を出すか、スコア画面を出すか判断するときに使う
//            proverbModelArr＝通常の25問のモデルが入っているArray
            vc?.currentProverbModelArr = proverbModelArr
        }
//            もし「間違えた問題だけ復習」ボタンが押されたら再テストを行う
        else if segue.identifier == "repeatButtonSegue" {
            
            if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<String> {
                
                let incorrectPage = incorrectArr[0]
                
//               stringのnumberをIntに変換して、「number - 1」の計算に使えるようにした
                if let number = Int(incorrectPage) {

//                  最初の問題を表示するためのコード
                    vc?.questionIndex = 0
                    //25問のArrayから間違った問題の素材を取得するために、numberを使ってindex番号を出す
                    let firstQuestionIndex = number - 1
//                   上の処理でindex番号がわかったので、proverbModelArrから間違えた問題の1番目を取得する
//                   2問目からはAnswerViewControllerから飛ぶが、 1問目だけはMainViewControllerから飛ぶので、別で取得する必要がある。
                    vc?.questionPageModel = proverbModelArr[firstQuestionIndex]
                }
                
                // 間違った問題だけが入っているArrayをつくるために、変数を設置
                var incorrectProverbArray: [ProverbModel] = []
                for pageNumber in incorrectArr {
//                    ↑pageNumberはstringなのでいintに変換する↓
                    if let number = Int(pageNumber) {
//                        全25問のなかで使われるindexのこと。
                        let index = number - 1
                        //全25問のArrayから、変数を使って対象となるindexを取得
                        let model = proverbModelArr[index]
//                        間違った問題だけを↓incorrectProverbArrayに入れる
                        incorrectProverbArray.append(model)
                    }
                }
//                間違った問題だけが入っているArray
//2つの問題の値を比較して、小さい順に並べ替える。それをコンピューターが何度も繰り返して、最終的には正しい順番で表示される。
                vc?.currentProverbModelArr = incorrectProverbArray.sorted(by: { (model1, model2) -> Bool in
                    
                    return Int(model1.number)! < Int(model2.number)!
                })

            }
        }
    }
}
