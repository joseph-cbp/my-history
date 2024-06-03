//
//  File.swift
//  
//
//  Created by Joseph Pereira on 20/05/24.
//

import Foundation
import SpriteKit

class MenuClass: SKSpriteNode{
    
    public var textoDaLabel = ""
    public override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.createRunButton()
        self.createAttackButton()
        self.position = CGPoint(x: 0, y: -300)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createAttackButton(){
        let attackButton = SKLabelNode(text: "Ataque")
        attackButton.fontSize = self.size.height * 0.2
        attackButton.fontName = "Chalkduster"
        attackButton.fontColor = SKColor.white
        attackButton.position = CGPoint(x: -400, y: 0)
        attackButton.name = "attackButton"
        addChild(attackButton)
    }
    
    private func createRunButton(){
        let runButton = SKLabelNode(text: "Fugir")
        runButton.fontSize = self.size.height * 0.2
        runButton.fontName = "Chalkduster"
        runButton.fontColor = SKColor.white
        runButton.position = CGPoint(x: 400, y: 0)
        runButton.name = "runButton"
        addChild(runButton)
    }
    
}
