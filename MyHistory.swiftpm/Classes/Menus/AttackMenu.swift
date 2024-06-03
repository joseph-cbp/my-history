//
//  File.swift
//  
//
//  Created by Joseph Pereira on 20/05/24.
//

import Foundation
import SpriteKit

class AttackMenu: SKSpriteNode{
    
    public var textoDaLabel = ""
    
    public override init(texture: SKTexture?, color: UIColor, size: CGSize){
        super.init(texture: texture, color: color, size: size)
        self.position = CGPoint(x: 0, y: -300)
        createButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons(){
        self.createAttackButton(text: "Pedra", name:"attack1", x: -450, y: -50)
        self.createAttackButton(text: "Milho", name:"attack2", x: 450, y: -50)
    }
    
    private func createAttackButton(text: String, name: String, x: Int, y: Int){
        let attackButton = SKLabelNode(text: text)
        attackButton.fontSize = self.size.height * 0.2
        attackButton.fontName = "Chalkduster"
        attackButton.fontColor = SKColor.white
        attackButton.position = CGPoint(x: x, y: y)
        attackButton.name = name
        attackButton.numberOfLines = 2
        addChild(attackButton)
    }
    
}
