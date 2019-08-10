//
//  AnswerViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/19.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var answerIndex: Int = 0
    var answerPageModel: ProverbModel?
    // 今表示させている諺がどんなArrayからの諺か
    // パターン1）メイン画面から"スタート"ボタンが押された時は25問のArrayが設定される
    // パターン2）メイン画面から"間違えた"ボタンが押された時は間違えた問題のArrayが設定される
    var currentProverbModelArr: [ProverbModel] = []
    
    @IBOutlet weak var jTranslation: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var explain: UILabel!
    
    // Nextボタンをタップした時
    @IBAction func nextQuestion(_ sender: Any) {

        // 最後のindexだったらScore画面に移動させる
        if answerIndex == currentProverbModelArr.count - 1  {
            
            self.performSegue(withIdentifier: "goToScoreSegue", sender: nil)
            
        } else {
            
            self.performSegue(withIdentifier: "backToQSegue", sender: nil)
            
        }
    }
    
    @IBAction func swipeGestureAction(_ sender: Any) {
        print("swipe")
    }
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? QuestionViewController
        
        let nextPage = answerIndex+1

        if nextPage < currentProverbModelArr.count {
            
            vc?.questionIndex = nextPage

            let nextProverbModel = currentProverbModelArr[nextPage]
            vc?.questionPageModel = nextProverbModel
            vc?.currentProverbModelArr = self.currentProverbModelArr

        }
        
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // これはQuestionViewControllerで定義されているUILabelの変数名です。
        
        // AnswerViewControllerでのUILabelの変数名は
        self.jTranslation.text = answerPageModel?.questionJp
        self.answer.text = answerPageModel?.correct
        self.explain.text = answerPageModel?.explanation
    }

}
