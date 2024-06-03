//
//  File.swift
//
//
//  Created by Joseph Pereira on 21/05/24.
//

import Foundation
import SpriteKit

class FinalLabel: SKSpriteNode{
    public var textLabel : SKLabelNode!
    public var padding: SKShapeNode!
    
    func addRunSceneText(text: String){
        let text = SKLabelNode(text: text)
        text.fontSize = self.size.height * 0.7
        text.fontName = "Chalkduster"
        text.fontColor = SKColor.white
        text.position = CGPoint(x: 0, y: 0)
        text.zPosition = 1
        self.textLabel = text
        addChild(self.textLabel)
    }
    
    public init(texture: SKTexture?, color: UIColor, size: CGSize, text:String){
        super.init(texture: texture, color: color, size: size)
        addRunSceneText(text: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createPadding(){
        self.padding = SKShapeNode(rectOf: CGSize(width: self.size.width * 0.4, height: self.size.height), cornerRadius: 50)
        self.padding.position = CGPoint(x: 0, y: 50)
        self.padding.fillColor = SKColor(.blue)
        self.padding.zPosition = 0
        self.padding.strokeColor = .clear
        self.padding.lineWidth = 0
        self.padding.name = "botaoIniciar"
        addChild(self.padding)
    }
    
}
