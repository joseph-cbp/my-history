//
//  File.swift
//  
//
//  Created by Joseph Pereira on 22/05/24.
//

import Foundation
import SpriteKit

class LifeBar: SKNode{
    private var life: [SKSpriteNode] = []
    private var lifeImage = SKSpriteNode(imageNamed: "Vida")
    
    init(qtd: Int) {
        super.init()
        lifeImage.setScale(6)
        for _ in 0..<qtd {
            #warning("Cuidado com o as! pois se der errado vai crashar")
            let nodeLifeImage = lifeImage.copy() as! SKSpriteNode
            self.life.append(nodeLifeImage)
            addChild(nodeLifeImage)
        }
        self.positionLives()
    }
    
    private func positionLives() {
           for (index, lifeNode) in life.enumerated() {
               // Define a posição de cada "vida" na barra
               lifeNode.position = CGPoint(x: index * Int(lifeNode.size.width), y: 0)
           }
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    #warning("Identação (tip: ctrl + i)")
    public func removeLifePoint(qtd: Int) {
        for _ in 0..<qtd{
                let point = self.life.popLast()
                removeChildren(in: [point!])
        }
    }
    public func lifeIsEmpty() -> Bool{
        return self.life.isEmpty
    }
}
