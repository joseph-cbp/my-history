//
//  Char.swift
//  BaseSpriteKit
//
//  Created by Joseph Pereira on 15/05/24.
//

import Foundation
import SpriteKit
import GameplayKit

public class Char: SKNode {
    public enum State{
        case stand, forward, backward, playerJump, galinhaJump, galinhaBicar
    }
    public var image: SKSpriteNode!
    public var animationStand: [SKTexture]!
    public var animationRun: [SKTexture]!
    
    init(image: SKSpriteNode, animationStand: [SKTexture]!, animationRun: [SKTexture]!) {
        self.image = image
        self.animationStand = animationStand
        self.animationRun = animationRun
        super.init()
        self.addChild(self.image)
        self.setScale(1)
        setState(inGame: .stand)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setState(inGame: State){
        switch inGame{
        case .stand:
            self.removeAllActions()
            self.image.run(.repeatForever(.animate(with: animationStand, timePerFrame: 0.2)))
        case .forward:
            if !verifyWidth(){
                image.size.width *= -1
            }
            self.run(.repeatForever(.move(by: CGVector(dx: 80, dy: 0), duration: 0.3)))
            image.run(.repeatForever(.animate(with: animationRun, timePerFrame: 0.2)))
        case .backward:
            if verifyWidth(){
                image.size.width *= -1
            }
            self.run(.repeatForever(.move(by: CGVector(dx: -80, dy: 0), duration: 0.3)))
            image.run(.repeatForever(.animate(with: animationRun, timePerFrame: 0.2)))
        case .playerJump:
            image.run(.repeat(.sequence([
                .move(to: .init(x: -500, y: 250), duration: 0.2),
                .move(to: .init(x: -500, y: 200), duration: 0.2)
            ]), count: 2))
            setState(inGame: .stand)
        case .galinhaJump:
            let jumping = SKAction.repeat(.sequence([
                .move(to: .init(x: 500, y: 250), duration: 0.15),
                .move(to: .init(x: 500, y: 200), duration: 0.15)
            ]), count: 2)
            let texture = SKAction.repeatForever(.animate(with: animationRun, timePerFrame: 0.2))
            let group = SKAction.group([jumping,texture])
            image.run(group)
        case .galinhaBicar:
            let jumping = SKAction.sequence([
                .move(to: .init(x: 500, y: 250), duration: 0.15),
                .move(to: .init(x: 500, y: 200), duration: 0.15),
                .move(to: .init(x: -500, y: 200), duration: 1),
                .move(to: .init(x: 500, y: 200), duration: 1.5)
            ])
            let texture = SKAction.repeatForever(.animate(with: animationRun, timePerFrame: 0.2))
            let group = SKAction.group([jumping,texture])
            image.run(group)
        }
    }
    
    private func verifyWidth() -> Bool{
        return image.size.width >= 0
    }
}
