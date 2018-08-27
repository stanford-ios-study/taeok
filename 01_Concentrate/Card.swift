//
//  Card.swift
//  01_Concentrate
//
//  Created by tae.ok on 2018. 8. 10..
//  Copyright © 2018년 taeok. All rights reserved.
//

import Foundation
// 구조체와 클래스의 차이
// 1. 구조체는 상속성이 없다. ( 좀 더 간단한 구조가 됨. 상속이 없어서 _
// 2. 구조체는 값 타입 , 클래스는 참조타입
// 값 타입은 인자로 보내거나 배열에 넣거나 , 다른 변수에 할당해도 복사됨
// 참조 타입은 값을 복사하기보다, 저장된 자료에 포인터를 참조하는것


// 모델을 만들 때, 주의할점 : 모델은 모델일뿐, 객체가 가지는 속성값을 넣으면 안됨.
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //  구조체는 반드시 
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
