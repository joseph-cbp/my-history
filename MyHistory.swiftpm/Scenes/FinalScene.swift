//
//  File.swift
//  
//
//  Created by Joseph Pereira on 25/05/24.
//

import Foundation
import SpriteKit

public class FinalScene: SKScene {
    private var text: String
    
    public init(text: String) {
        self.text = text
        super.init(size: .init(width: 1920, height: 1080))
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
    }
    
    public func addLabelNode(){
        let labelNode = FinalLabel(texture: nil, color: SKColor(.clear), size: CGSize(width: self.size.width * 0.2, height: self.size.height * 0.2), text: self.text)
        addChild(labelNode)
    }
    
    
    public override func sceneDidLoad() {
        addLabelNode()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.presentScene(StartScene(), transition: .fade(withDuration: 1.5))
    }
    
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
