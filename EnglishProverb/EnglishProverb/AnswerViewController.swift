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
    
//    var normalProverbModelArr: [ProverbModel] = []
//    var retestProverbModelArr: [ProverbModel] = []
//    var isRetest: Bool = false
    
    @IBOutlet weak var jTranslation: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var explain: UILabel!
    
    // Nextボタンをタップした時
    @IBAction func nextQuestion(_ sender: Any) {

        print(answerIndex)
        print(currentProverbModelArr.count)
        
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

        // Do any additional setup after loading the view.
//    参照用
//        proverbLabel.text = questionPageModel?.questionJp
//
//        aButton.setTitle(questionPageModel?.answers[0], for: UIControl.State.normal)
//        bButton.setTitle(questionPageModel?.answers[1], for: UIControl.State.normal)
//        cButton.setTitle(questionPageModel?.answers[2], for: UIControl.State.normal)
        

//            "question_en": "Birds of a feather flock together.",
//            "question_jp": "類は友を呼ぶ",
//            "answer_a": "flock",
//            "answer_b": "gather",
//            "answer_c": "crowd",
//            "correct": "flock",
//            "explanation": "“a feather”は一つの羽・同じ羽を意味し、“flock”は「群がる」の意味です。「同じ羽の鳥（同じ種類の鳥）は一緒に群れる」という意味となります。"
 
        
        // これはQuestionViewControllerで定義されているUILabelの変数名です。
        // proverbLabel.text = questionPageModel?.question_jp
        
        // AnswerViewControllerでのUILabelの変数名は
        self.jTranslation.text = answerPageModel?.questionJp
        self.answer.text = answerPageModel?.correct
        self.explain.text = answerPageModel?.explanation
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
