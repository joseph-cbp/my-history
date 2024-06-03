//
//  File.swift
//  
//
//  Created by Joseph Pereira on 17/05/24.
//

import Foundation
import SpriteKit

class Player : BattleChar {
    public var fuga: Bool = false
    
    public func fugir(){
        self.fuga = true
    }
    public enum Ataques{
        case jogarPedra, chamarPai, jogarMilho
    }
    
    
    public func ataques(movimentos: Ataques, BattleChar: BattleChar){
        switch movimentos{
        case .jogarPedra:
            self.ataque(BattleChar: BattleChar)
            BattleChar.modificarCoragem(modificador: 1)
        case .chamarPai:
            break
        case .jogarMilho:
            fugir()
        }
    }
}
