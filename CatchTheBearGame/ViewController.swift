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
        
        //Timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
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
            
            //Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                //replay function
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
}

