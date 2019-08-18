//
//  AnswerViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/19.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

//    0という値は適当。QuestionViewControllerのprepareで直前に値を書き換えるので、ここはどんな値を入れてもOK。
    var answerIndex: Int = 0
    var answerPageModel: ProverbModel?
    // 今表示させている諺がどんなArrayからの諺か
    // パターン1）メイン画面から"スタート"ボタンが押された時は25問のArrayが設定される
    // パターン2）メイン画面から"間違えた"ボタンが押された時は間違えた問題のArrayが設定される
    var currentProverbModelArr: [ProverbModel] = []
    //    weak:outletに自動的につく。
//    outlet：outlet以外にも＠がついているものは、storyboardと繋がっているという意味。
    @IBOutlet weak var jTranslation: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var explain: UILabel!
    
    // Nextボタンをタップした時
    @IBAction func nextQuestion(_ sender: Any) {

        // 最後のindexだったらScore画面に移動させる
//currentProverbModelArrの数は場合によって違う。25問のときもあるし、間違えた問題の数のときもある。
        if answerIndex == currentProverbModelArr.count - 1  {
            
            self.performSegue(withIdentifier: "goToScoreSegue", sender: nil)
            
        } else {
//            senderは次のアクションに何か渡したいときに書くが、今回はないのでnilを入れる。
            self.performSegue(withIdentifier: "backToQSegue", sender: nil)
            
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextQuestionViewController = segue.destination as? QuestionViewController
        
        let nextIndex = answerIndex + 1

        if nextIndex < currentProverbModelArr.count {
            
            nextQuestionViewController?.questionIndex = nextIndex

//            nextIndexを使って全問の中から、次の問題の詳細を取得する
            nextQuestionViewController?.questionPageModel = currentProverbModelArr[nextIndex]
//  次の画面（QuestionViewController）に詳細を渡すため
            nextQuestionViewController?.currentProverbModelArr = self.currentProverbModelArr

        }
        
    }    
//    viewDidLoad：新しい画面が生成されるときに呼ばれる
    override func viewDidLoad() {
//        サブクラスがもっている変数、ファンクションを見るときsuperを使う
        super.viewDidLoad()

        // これ👇はQuestionViewControllerで定義されているUILabelの変数名です。
        // AnswerViewControllerでのUILabelの変数名は
        self.jTranslation.text = answerPageModel?.questionJp
        self.answer.text = answerPageModel?.correct
        self.explain.text = answerPageModel?.explanation
    }
}
