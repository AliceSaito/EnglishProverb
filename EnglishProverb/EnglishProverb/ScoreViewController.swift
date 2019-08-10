//
//  ScoreViewController.swift
//  EnglishProverb
//
//  Created by ALICE SAITO on 2019/07/28.
//  Copyright © 2019 ALICE SAITO. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreButton: UIButton!
    
    @IBOutlet weak var mountainimage: UIImageView!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreclass: UILabel!
    @IBOutlet weak var scorecomment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        コピーしたもの⇩
//        open class func animate(withDuration duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIViewAnimationOptions = [], animations: @escaping () -> Swift.Void, completion: ((Bool) -> Swift.Void)? = nil)

        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [.repeat], animations: {
            
            self.scoreLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        }) { (isFinished) in

            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: [.repeat], animations: {
                
                self.scoreLabel.transform = CGAffineTransform.identity
                
            })
        }
                
        if let incorrectArr = UserDefaults.standard.value(forKey: "Incorrectagain") as? Array<String> {
            
            //            incorrectArr.count
            
            // "4/ 5"
            scoreLabel.text = "\(25 - incorrectArr.count)/ 25"
            
            let correctCount = 25 - incorrectArr.count
            
            if correctCount == 0 {
                //            怒るクマ
                mountainimage.image = UIImage.init(named: "angrykuma")
                scoreclass.text = "底辺級"
               scorecomment.text = "ガオー！！！"
                
            }
                
            else if correctCount >= 1 && correctCount <= 5 {
                //                高尾山
                mountainimage.image = UIImage.init(named: "takaozan")
                scoreclass.text = "高尾山級"
                scorecomment.text = "標高599ｍ。\nやる気ある？\n天狗も引いてるぞ。"
                
            }
            else if correctCount >= 6 && correctCount <= 10 {
                //                白頭山
                mountainimage.image = UIImage.init(named: "peaktu")
                scoreclass.text = "ペクトゥ山級"
                scorecomment.text = "標高2744ｍ。\nこらこら〜。\n噴火しちゃうぞ！"
                
                
            }
            else if correctCount >= 11 && correctCount <= 15 {
                //                富士山
                mountainimage.image = UIImage.init(named: "fujisan")
                scoreclass.text = "富士山級"
                scorecomment.text = "標高3776ｍ。\n日本では上位かも。\n世界を目指そうよ！"
                
            }
            else if correctCount >= 16 && correctCount <= 20 {
                //                マッターホルン
                mountainimage.image = UIImage.init(named: "matterhorn")
                scoreclass.text = "マッターホルン級"
                scorecomment.text = "標高4778ｍ。\nまぁまぁじゃない？\nビバークしちゃった？"
                
            }
            else if correctCount >= 21 && correctCount <= 24 {
                //                アルプス
                mountainimage.image = UIImage.init(named: "alps")
                scoreclass.text = "アルプス級"
                scorecomment.text = "標高4810ｍ。\nなかなかやるねぇ。\nスイス人もびっくり！"
                
            }
                
            else if correctCount == 25 {
                //                エベレスト
                mountainimage.image = UIImage.init(named: "mount-everest")
                scoreclass.text = "エベレスト級"
                scorecomment.text = "標高8848ｍ。\n天才ですか！！？\nあんたが大将。Mr.チョモランマ。"
                
            }
            else {
                print("")
            }
        }
        
    }
        
}
