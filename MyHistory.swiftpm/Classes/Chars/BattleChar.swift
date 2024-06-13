//
//  File.swift
//  
//
//  Created by Joseph Pereira on 16/05/24.
//

import Foundation
import SpriteKit

class BattleChar {
    #warning("Apagar os comentários desnecessários")
//    private var vida: Int {get,set}
    #warning("Mix de Portugues com ingles")
    public var vida: Int = 5
    private var coragem: Int = 0
    private var forca: Int = 1
    #warning("Não precisa ser um optional, e ainda por cima unrapped")
    var char: Char!
    
    init(image: SKSpriteNode, animationStand: [SKTexture], animationRun:[SKTexture]) {
        self.char = Char(image: image, animationStand: animationStand, animationRun: animationRun)
    }
    
    #warning("Nome de variáveis devem seguir o camelCase")
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
