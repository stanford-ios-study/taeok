//
//  ViewController.swift
//  Concentration
//
//  Created by tae.ok on 2018. 8. 4..
//  Copyright © 2018년 taeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// 인스턴트변수는 반드시 초기화해줘야함.
// didSet -> 변수의 속성감지
//
    /*
     - var flipCount:Int -> Int를 써줄 필요가 없음.  '0' , '0.2' 추론하여 타입을 지정함.
     */
    var flipCount:Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("First Card")
        
        flipCount += 1
        
        //flipCard(withEmoji: "👻", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        print("Second Card")
        
        flipCount += 1
        
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    func flipCard(withEmoji emoji:String, on button: UIButton)
    {
        print("FlipCard(withEmoji: \(emoji))")  // \(인자)
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    

}

