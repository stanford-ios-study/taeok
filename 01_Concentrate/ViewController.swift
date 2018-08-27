// Art + 변수 - > Overview
// Cmd + 변수 - > 정의, 이름변경
// didSet -> 변수의 속성감지
// \() -> 유용함
// 변하지 않는 상수는 'let' 상수처리 해줘야 함.

//


// 옵셔널 사용법 익히기

import UIKit

class ViewController: UIViewController {
    
    @IBAction func ResetButton(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2 )
        emojiChoices = ["🦇", "😱", "🙀", "👿", "🎃", "👻", "🍭", "🍬", "🍎"]
        updateViewFromModel()
        flipCount = 0
    }
    
    // 변수명 앞에 lazy를 붙이면, 사용되기전까지 초기화되지 않음. 단, lazy와 didset을 함께 사용할 수 없음.
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2 )
    
    // 인스턴트변수는 반드시 초기화해줘야함.
    // didSet -> 변수의 속성감지
    //
    /*
     - var flipCount:Int -> Int를 써줄 필요가 없음.  '0' , '0.2' 추론하여 타입을 지정함.
     */

    private(set) var flipCount:Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    // UIButton의 배열
    // 배열을 만들땐, 변수형을 꼭 명시해주어야 함.
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        print("First Card")
        print("touch : \(sender)")
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            print("CardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("not in card")
        }
        // flipCard(withEmoji: "👻", on: sender)
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.1209421232, green: 0.8715704083, blue: 0.8561379313, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🦇", "😱", "🙀", "👿", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    private var emoji = [Int:String]() //59분
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random) // 이모티콘 딕셔너리에서 이모티콘을 가져오는동시에 딕셔너리에 있는 이모티콘을 지움, 이유는 같은 이모티콘의 카드가 존재할 수 있기 때문에.
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    func flipCard(withEmoji emoji:String, on button:UIButton)
    {
        print("FlipCard(withEmoji: \(emoji))")  // \(인자)
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.1209421232, green: 0.8715704083, blue: 0.8561379313, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

