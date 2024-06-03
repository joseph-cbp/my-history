//
//  File.swift
//  
//
//  Created by Joseph Pereira on 21/05/24.
//

import Foundation
import SpriteKit

class TextLabel: SKSpriteNode{
    
    public var text: String = "O que fazer ?" {
        didSet{
            textLabel.text = text
        }
    }
    public var textLabel : SKLabelNode!
    
    private func createTextLabel( /*name: String, x: Int, y: Int*/){
        let textLabel = SKLabelNode(text: self.text)
        textLabel.fontSize = self.size.height * 0.4
        textLabel.fontName = "Chalkduster"
        textLabel.fontColor = SKColor.white
        textLabel.position = CGPoint(x: 0, y: -40)
        textLabel.name = name
        textLabel.numberOfLines = 2
        textLabel.color = SKColor(.black)
        self.textLabel = textLabel
        addChild(textLabel)
    }
    
    public override init(texture: SKTexture?, color: UIColor, size: CGSize){
        super.init(texture: texture, color: color, size: size)
        createTextLabel(/*name: String, x: <#T##Int#>, y: <#T##Int#>*/)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
