//
//  ViewController.swift
//  滑动猜数字
//
//  Created by admin on 2019/12/26.
//  Copyright © 2019 内师大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    
    var currentValue = 0   //当前实际数值的变量
    var targetValue = 0   //目标值变量
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    func startNewRound() {
        round += 1
        targetValue =  1 + Int(arc4random_uniform(100))
        currentValue = 0
        slider.value = Float(currentValue)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue =  lroundf(slider.value)    }
    

    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if points == 100 {
            title = "完美"
            points += 100
        }else if points > 95 {
            title = "差一点！"
            if points == 99 {
                points += 50
            }
        }else if points > 80 {
            title = "不错呦"
        }else {
            title = "差很多"
        }
        score += points
        
        let message = "你的分数是 \(points)"
        let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startOver(_ sender: Any) {
        score=0
        round=0
        startNewGame()
        updateLabels()
    }
    
 
    
}

