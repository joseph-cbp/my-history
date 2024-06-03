//
//  File.swift
//  
//
//  Created by Joseph Pereira on 28/05/24.
//

import Foundation
import SpriteKit

public class StartScene: SKScene {
    var background = SKSpriteNode(imageNamed: "Background")
    var text = SKSpriteNode(imageNamed: "Canva")
    var label: FinalLabel!
    
    public override init() {
        super.init(size: .init(width: 1920, height: 1080))
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addLabeNode(){
        let labelNode = FinalLabel(texture: nil, color: SKColor(.clear), size: CGSize(width: self.size.width, height: self.size.height * 0.18), text: "Iniciar")
//        labelNode.textLabel.fontColor = SKColor.blue
        labelNode.position = CGPoint(x: 0, y: -340)
        self.label = labelNode
        self.label.createPadding()
        self.label.textLabel.name = "botaoIniciar"
        addChild(self.label)
    }
    
    public func setBackgrond(){
        self.background.position = CGPoint(x: 0, y: 0)
        self.background.zPosition = -1
        self.background.size = self.size
        addChild(self.background)
    }
    
    public func addText(){
        self.text.position = CGPoint(x: 0, y: 120)
        self.text.size = CGSize(width: self.size.width * 0.6, height: self.size.height * 0.6)
        self.text.zPosition = 0
        addChild(self.text)
    }
    
    public func addButton(){}
    
    public override func sceneDidLoad() {
        addLabeNode()
        setBackgrond()
        addText()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "botaoIniciar" {
                self.view?.presentScene(GameScene(), transition: .fade(withDuration: 1.5))
            }
        }
    }
}
