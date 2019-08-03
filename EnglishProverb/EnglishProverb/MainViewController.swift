//
//  MainViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/18.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var kumaImageView: UIImageView!
    
    // ビューが初めて表示される時、このファンクションが呼び出される
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //くまの背景を透明にする処理
        kumaImageView.backgroundColor = UIColor.clear
        
        // くまのアニメーション処理
        kumaImageView.animationImages = [UIImage.init(named: "kiss00")!,UIImage.init(named: "kiss01")!,UIImage.init(named: "kiss02")!,UIImage.init(named: "kiss03")!,UIImage.init(named: "kiss04")!,UIImage.init(named: "kiss05")!,UIImage.init(named: "kiss06")!]
        kumaImageView.image = UIImage.init(named: "kiss06")
        kumaImageView.animationDuration = 3
        kumaImageView.animationRepeatCount = 1
        kumaImageView.startAnimating()
        
        /*
         ["question_en": "Birds of a feather flock together.",
         "question_jp": "類は友を呼ぶ",
         "answer_a": "flock",
         "answer_b": "gather","answer_c": "crowd","correct": "flock",
         "explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"],
         */
        for kotowaza in proverbs {
            print(kotowaza)
            
            let choco = ProverbModel.init()
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
            
            proverbModelArr.append(choco)
        }
        
        if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<Int> {
            
            if incorrectArr.count > 0 {
                
                repeatButton.isHidden = false
            }
            else if incorrectArr.count < 1 {
                
                repeatButton.isHidden = true
                
            }
        }
    }        // Storyboard上で移動される直前ViewControllerに変数を渡す(設定)ため
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? QuestionViewController
        
        if segue.identifier == "startButtonSegue" {
            
            vc?.questionIndex = 0
            vc?.questionPageModel = proverbModelArr[0]
            
            // 通常の25問のモデルが入っているArrayを設定する
            vc?.currentProverbModelArr = proverbModelArr
            
        }
        else if segue.identifier == "repeatButtonSegue" {
            
            if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<Int> {
                
                if incorrectArr.count > 0 {
                    
                    let inCorrectPage = incorrectArr[0]
                    
                    vc?.questionIndex = inCorrectPage
                    vc?.questionPageModel = proverbModelArr[inCorrectPage]
                    
                    // 間違った問題しか入っていないArrayを設定する
                    
                    if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<Int> {
                     
                        // ここには間違った問題のPage番号がArrayに入っている

                        // MapはArrayの中身を他のTypeで変換して返すことができる
                        // 返された値は別のArrayに格納されて返される
//                        let newIncorrectArray: [ProverbModel] = incorrectArr.map { (index) -> ProverbModel in
//
//                                                                return proverbModelArr[index]
//                                                            }

                        var incorrectProverbArray: [ProverbModel] = []
                        for index in incorrectArr {

                            let model = proverbModelArr[index]
                            incorrectProverbArray.append(model)
                        }
                        
                        vc?.currentProverbModelArr = incorrectProverbArray                        
                    }
                }
                
            }
            
            
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
