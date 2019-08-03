//
//  QuestionViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/18.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex: Int = 0
    // 
    var questionPageModel: ProverbModel?
    
//    var isRetest: Bool = false
    // 今表示させている諺がどんなArrayからの諺か
    // 例1）通常の諺 25問の中での一つか
    // 例2）間違った問題の中での一つか
    var currentProverbModelArr: [ProverbModel] = []
    
//    var normalProverbModelArr: [ProverbModel] = []
//    var retestProverbModelArr: [ProverbModel] = [] 
    
    // Storyboard上で移動される直前ViewControllerに変数を渡す(設定)ため
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let answerViewController = segue.destination as? AnswerViewController

        answerViewController?.answerIndex = self.questionIndex
        answerViewController?.answerPageModel = self.questionPageModel
        answerViewController?.currentProverbModelArr = self.currentProverbModelArr
        
    }
    

    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var proverbLabel: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    
    @IBAction func touchA(_ sender: UIButton) {
        print("touchA")
        checkCorrect(tappedButton: aButton)
    }
    
    @IBAction func touchB(_ sender: UIButton) {
        print("touchB")
        checkCorrect(tappedButton: sender)
    }
    
    @IBAction func touchC(_ sender: UIButton) {
        print("touchC")
        checkCorrect(tappedButton: sender)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexLabel.text = "Q" + (questionPageModel?.number ?? "")
        
        let questionEn = questionPageModel?.questionEn ?? ""
        let correct = questionPageModel?.correct ?? ""
        
        // 英語問題の全文をAttributedStringで定義
        let attributedString = NSMutableAttributedString(string: questionEn)
        // 英語問題の全文のはスタート時点を変数に保存
        var startIndex = questionEn.startIndex
        // 英語問題の全文の 正解文言
        while let range = questionEn.range(of: correct, options: .regularExpression, range: startIndex..<questionEn.endIndex) {
            
            attributedString.addAttribute(.backgroundColor, value: UIColor.black, range: NSRange(range, in: questionEn))
            startIndex = range.upperBound
        }

        proverbLabel.attributedText = attributedString
        
        // 選択肢をランダムに順序を変える
        if var anArray = questionPageModel?.answers {
            
            //shuffleする
            for i in 0 ..< anArray.count {
                let r = Int(arc4random_uniform(UInt32(anArray.count)))
                anArray.swapAt(i, r)
            }
            
            aButton.setTitle(anArray[0], for: UIControl.State.normal)
            bButton.setTitle(anArray[1], for: UIControl.State.normal)
            cButton.setTitle(anArray[2], for: UIControl.State.normal)
        }
        
    }

    func checkCorrect(tappedButton: UIButton) {
        
        // 正解判断
        let question = tappedButton.title(for: UIControl.State.normal)
        
        if questionPageModel?.correct == question {
            // 正解の場合はここに入る
            // 1. ⭕️ボタンのイメージを設定する
            // 2. ⭕️ボタンを表示する
            resultButton.setBackgroundImage(UIImage.init(named: "maru"), for: UIControl.State.normal)
            // Boolenとは trueかfalseこの二つのタイプしか設定できないデータタイプ
            // 例）let varlue： Bool ＝ true
            resultButton.isHidden = false
        
            // 再テストで不正解だった問題が正解になった時
            
            if var oldIncorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<Int> {
                
                // 例えば不正解のindexが　こんな感じで[1, 2, 4]保存されたとする
                
//                for value in array {
//  これはテストです。キム先生。
//                }
                
            
                for (index, incorrectIndex) in oldIncorrectArr.enumerated() {
                    
                    print("index: \(index)")
                    print("incorrectIndex: \(incorrectIndex)")
                    
                    if incorrectIndex == self.questionIndex {
                        
                        // 以前不正解だったindexが今回は正解となったためArrayから削除する
                        oldIncorrectArr.remove(at: index)
                    }
                }
                
                UserDefaults.standard.set(oldIncorrectArr, forKey: "Incorrectagain")
                
            }
            
        }
        else {
            // 不正解の場合はここに入る
            // 1. ❌ボタンのイメージを設定する
            // 2. ❌ボタンを表示する
            resultButton.setBackgroundImage(UIImage.init(named: "batsu"), for: UIControl.State.normal)
            resultButton.isHidden = false
            
            // 不正解の時問題のIndexをArrayに入れてUserDefaultに保存する
            
            // 以前UserDefaultに保存された不正解のArrayがある場合
            if var oldIncorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<Int> {
                
                oldIncorrectArr.append(questionIndex)
                UserDefaults.standard.set(oldIncorrectArr, forKey: "Incorrectagain")
            }
            // UserDefaultに不正解のArrayが保存されていない場合
            else {
                var incorrectArr: Array<Int> = []
                incorrectArr.append(questionIndex)
                
                UserDefaults.standard.set(incorrectArr, forKey: "Incorrectagain")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
}
