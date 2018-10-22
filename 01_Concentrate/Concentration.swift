//
//  Concentration.swift
//  01_Concentrate
//
//  Created by tae.ok on 2018. 8. 10..
//  Copyright © 2018년 taeok. All rights reserved.
//

import Foundation

class Concentration
{
    //var cards: Array<Card>()
    // Array<Card>라는 배열은 존재하나, () 안에 인수같은것이 아무것도 없는 배열
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            // 앞면인 카드만 걸러서 그 카드의 인덱스만 리턴하는것
            return cards.indices.filter{ cards[$0].isFaceUp}.oneAndOnly
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    }
//                    else {
//                        return nil
//                    }
//                }
//            }
//             return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): 선택된 인덱스에 해당하는 카드가 없습니다.")
        if !cards[index].isMatched {    // cards가 
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): 적어도 한 개 이상이 되어야 합니다.")
        var shuffle = [Card]()
        
        for _ in 1...numberOfPairsOfCards {
           
            let card = Card()
    
            shuffle += [card , card]
            
            // TODO : Shuffle the Cards 
                print("card count:\(cards.count)")
        }
        
        for i in 0..<shuffle.count
        {
            let rand = Int(arc4random_uniform(UInt32(shuffle.count)))
            
            cards.append(shuffle[rand])
            
            shuffle.remove(at: rand)
            
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
