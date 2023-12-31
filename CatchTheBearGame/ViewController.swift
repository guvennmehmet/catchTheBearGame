//
//  ViewController.swift
//  CatchTheBearGame
//
//  Created by Mehmet Güven on 6.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var bearArray = [UIImageView] ()
    var hideTimer = Timer()
    var highScore = 0
    
    
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var bear1: UIImageView!
    @IBOutlet weak var bear2: UIImageView!
    @IBOutlet weak var bear3: UIImageView!
    @IBOutlet weak var bear4: UIImageView!
    @IBOutlet weak var bear5: UIImageView!
    @IBOutlet weak var bear6: UIImageView!
    @IBOutlet weak var bear7: UIImageView!
    @IBOutlet weak var bear8: UIImageView!
    @IBOutlet weak var bear9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        //Images
        bear1.isUserInteractionEnabled = true
        bear2.isUserInteractionEnabled = true
        bear3.isUserInteractionEnabled = true
        bear4.isUserInteractionEnabled = true
        bear5.isUserInteractionEnabled = true
        bear6.isUserInteractionEnabled = true
        bear7.isUserInteractionEnabled = true
        bear8.isUserInteractionEnabled = true
        bear9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        
        bear1.addGestureRecognizer(recognizer1)
        bear2.addGestureRecognizer(recognizer2)
        bear3.addGestureRecognizer(recognizer3)
        bear4.addGestureRecognizer(recognizer4)
        bear5.addGestureRecognizer(recognizer5)
        bear6.addGestureRecognizer(recognizer6)
        bear7.addGestureRecognizer(recognizer7)
        bear8.addGestureRecognizer(recognizer8)
        bear9.addGestureRecognizer(recognizer9)
        
        bearArray = [bear1, bear2, bear3, bear4, bear5, bear6, bear7, bear8, bear9]
        
        //Timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideBear), userInfo: nil, repeats: true)
        
        hideBear()
        
    }
    
    @objc func hideBear() {
        for bear in bearArray {
            bear.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(bearArray.count - 1)))
        bearArray[random].isHidden = false
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for bear in bearArray {
                bear.isHidden = true
            }
            
            //HighScore
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            
            //Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                //replay function
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideBear), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
}

