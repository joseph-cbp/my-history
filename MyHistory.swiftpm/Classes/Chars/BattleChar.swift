//
//  File.swift
//  
//
//  Created by Joseph Pereira on 16/05/24.
//

import Foundation
import SpriteKit

class BattleChar {
//    private var vida: Int {get,set}
    public var vida: Int = 5
    private var coragem: Int = 0
    private var forca: Int = 1
    var char: Char!
    
    init(image: SKSpriteNode, animationStand: [SKTexture], animationRun:[SKTexture]) {
        self.char = Char(image: image, animationStand: animationStand, animationRun: animationRun)
    }
    
    public func ataque(BattleChar: BattleChar)-> Int{
        let dano = (self.coragem + self.forca)
        BattleChar.subtrairVida(dano: dano)
        return dano
    }
    public func subtrairVida(dano: Int){
        self.vida = self.vida - dano
    }
    public func modificarCoragem(modificador: Int){
        self.coragem = self.coragem + modificador
    }
}
