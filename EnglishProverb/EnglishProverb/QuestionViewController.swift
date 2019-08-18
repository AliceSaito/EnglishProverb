//
//  QuestionViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/18.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//
//UIkitはアップルが用意したコードのパッケージ
import UIKit

// storyboardとソースコードをつなげるため
// 問題を表示させるためのViewController
class QuestionViewController: UIViewController {
//    100 という値は適当。MainViewControllerのprepareで直前に値を書き換えるので、ここはどんな値を入れてもOK。
    var questionIndex: Int = 100
    // ProverbModelの変数名がquestionPageModel
    var questionPageModel: ProverbModel?
    

// currentProverbModelArrは全25問の入っているArrayにも、間違えた問題だけが入っているArrayにもなれる。これは、AnswerViewControllerからScoreViewControllerに飛ぶときにも必要なので、この変数名をもつ。
    var currentProverbModelArr: [ProverbModel] = []
//   サブクラスがもっているfuncを呼び出す（使う）ときにoverrideが使われる。
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
    
    
//    overrideのあとにはsuperが来る！
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexLabel.text = "Q " + (questionPageModel?.number ?? "")
        
        let questionEn = questionPageModel?.questionEn ?? ""
        let correct = questionPageModel?.correct ?? ""
        
        // AttributedStringは文字の色やフォント、サイズなどを指定できるすごいstring
//        全部をすごいstringにして、一部だけを黒塗りにする。
        let attributedString = NSMutableAttributedString(string: questionEn)
       
        // 対象となる文章全体のスタート地点と最終地点を指定してあげる。
//        regularExpression：探す方法を指定できる。
//        whileは条件付きのfor文。
        var startIndex = questionEn.startIndex
        while let range = questionEn.range(of: correct, options: .regularExpression, range: startIndex..<questionEn.endIndex) {
//            range＝範囲。下記は変更内容の詳細。
            attributedString.addAttribute(.backgroundColor, value: UIColor.black, range: NSRange(range, in: questionEn))
//startIndexを最初はquestionEn.startIndexに指定するんだけど、対象の部分が見つかったらrange.upperBoundに変えることで検索を終了させる。
            startIndex = range.upperBound
        }

//        proverbLabel.text = ""のattributedStringバージョンが下記。
//        attributedStringはストーリーボードのLabelでも変更できる。
        proverbLabel.attributedText = attributedString
        
        // 選択肢をランダムに入れ替える
        if var anArray = questionPageModel?.answers {
            
            //shuffleする。 「..<」は「●〜●」の意味。
            for i in 0 ..< anArray.count {
                let r = Int(arc4random_uniform(UInt32(anArray.count)))
                anArray.swapAt(i, r)
            }
//         Lableには.textを使うように、buttonには.setTitleを使う。buttonはstateを指定する必要がある。
//            下記のものに、上記の処理を加える。
            aButton.setTitle(anArray[0], for: UIControl.State.normal)
            bButton.setTitle(anArray[1], for: UIControl.State.normal)
            cButton.setTitle(anArray[2], for: UIControl.State.normal)
        }
        
    }
// 正解か不正解をチェックするためのfunc。
    func checkCorrect(tappedButton: UIButton) {
        
        // correctと比較するために、タップしたボタンに入っている文字を取得する。questionという変数で保存。
        let question = tappedButton.title(for: UIControl.State.normal)
        
//変数questionの文字と、correctの文字が合っているかを照合。
        if questionPageModel?.correct == question {
            // 正解の場合はここに入る
            // 1. ⭕️ボタンのイメージを設定する
            // 2. ⭕️ボタンを表示する↓
            resultButton.setBackgroundImage(UIImage.init(named: "maru"), for: UIControl.State.normal)
            // Boolenとは trueかfalseこの二つのタイプしか設定できないデータタイプ
            // 例）let varlue： Bool ＝ true
            resultButton.isHidden = false
        
            // 再テストで不正解だった問題が正解になった時に照合するためにある。
            let proverbModel =  self.questionPageModel!

//     UserDefaultsのタイプはいつもAnyで出るので、Arrayの値がStringだったら、{}の中の処理が行われる。
//            as「〜として」の意味。
            if var oldIncorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<String> {
                
                // 例えば不正解のindexが　こんな感じで[1, 2, 4]保存されたとする
                for (index, incorrectNumber) in oldIncorrectArr.enumerated() {
                    
                    if incorrectNumber == proverbModel.number {
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
            
//間違えた問題のnumberをUserdefaultsに保存させるためにquestionPageModel.numberを参照する
            let questionNumber = self.questionPageModel!.number
            
            // 不正解の時問題のIndexをArrayに入れてUserDefaultに保存する
            
    //以前UserDefaultに保存された不正解のnumberが入っているArrayがある場合、既存のArrayに今のnumberを追加(append)する。問２、問３と積み重なっていく。
            if var oldIncorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<String> {
                
                // 以前間違ったnumberがoldIncorrectArrに保存されていたらこのnumberは追加しない
//                （ex.問３を立て続けに２回間違えたとき、同じ問３が２回Arrayに入らないように）
                if oldIncorrectArr.contains(questionNumber) == false {
                    
                    oldIncorrectArr.append(questionNumber)
                    UserDefaults.standard.set(oldIncorrectArr, forKey: "Incorrectagain")
                }
            }
            // UserDefaultに不正解のArrayが保存されていない場合。
//            一回も不正解がない場合。新しいArrayをつくって、そこに保存する。
            else {
                var incorrectArr: Array<String> = []
                incorrectArr.append(questionNumber)
                
                UserDefaults.standard.set(incorrectArr, forKey: "Incorrectagain")
            }
        }
    }
}
