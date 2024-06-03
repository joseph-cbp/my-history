//
//  File.swift
//
//
//  Created by Joseph Pereira on 28/05/24.
//


import Foundation
import SpriteKit
import GameplayKit

func addTextures(quantity: Int, prefix: String) -> [SKTexture]{
    var animation: [SKTexture] = []
    for i in 0...quantity{
        animation.append(SKTexture(imageNamed: prefix + "\(i)"))
        animation[i].filteringMode = .nearest
    }
    return animation
}


public class GameScene: SKScene {
    
    var player: Char!
    var background = SKSpriteNode(imageNamed: "Background")
    
    func addPlayer(){
        let player = Char(image: SKSpriteNode(imageNamed: "Garoto_f0"), animationStand: addTextures(quantity: 0, prefix: "Garoto_f"), animationRun: addTextures(quantity: 1, prefix: "Garoto_r"))
        
        player.position = CGPoint(x: -500, y: -100)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.calculateAccumulatedFrame().size)
        player.physicsBody?.categoryBitMask = 2
        player.physicsBody?.contactTestBitMask = 4
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.affectedByGravity = false
        player.name = "garoto"
        self.player = player
        addChild(player)
    }
    
    func addGalinha(){
        let galinha = Char(image: SKSpriteNode(imageNamed: "Galinha_f0"), animationStand: addTextures(quantity: 3, prefix: "Galinha_f"), animationRun: addTextures(quantity: 1, prefix: "Galinha_a"))
        galinha.image.position = CGPoint(x: 500, y: -100)
        addChild(galinha)
    }
    
    func addMilho(){
        let milho = SKSpriteNode(imageNamed: "Milho")
        milho.position = CGPoint(x: 250, y: -100)
        milho.setScale(1)
//        milho.zRotation = -0.5
        milho.physicsBody = SKPhysicsBody(rectangleOf: milho.size)
        milho.physicsBody?.affectedByGravity = false
        milho.physicsBody?.categoryBitMask = 4
//        milho.physicsBody?.contactTestBitMask = 2
        milho.physicsBody?.collisionBitMask = 0
        milho.name = "milho"
        addChild(milho)
    }
    
    public override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
    }
    
    public override init() {
        super.init(size: .init(width: 1920, height: 1080))
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setBackgrond(){
        self.background.position = CGPoint(x: 0, y: 0)
        self.background.zPosition = -1
        self.background.size = self.size
        addChild(self.background)
    }
    
    public override func sceneDidLoad() {
        addPlayer()
        addGalinha()
        addMilho()
        setBackgrond()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.isEmpty{
            
        }else{
            let location = touches.first?.location(in: self)
            if location!.x >= 0 {
                player.setState(inGame: .forward)
            }else if location!.x < 0 {
                player.setState(inGame: .backward)
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.setState(inGame: .stand)
    }

    
//    public override func sceneDidLoad() {
//        let sprite = SKSpriteNode(imageNamed: "chiko_run1")
//        self.addChild(sprite)
//        sprite.setScale(6)
//        sprite.texture?.filteringMode = .nearest
//        
//        sprite.run(.repeatForever(.animate(with: [
//            SKTexture(imageNamed: "chiko_run1"),
//            SKTexture(imageNamed: "chiko_run2"),
//            SKTexture(imageNamed: "chiko_run3"),
//            SKTexture(imageNamed: "chiko_run4"),
//            SKTexture(imageNamed: "chiko_run5"),
//            SKTexture(imageNamed: "chiko_run6"),
//            SKTexture(imageNamed: "chiko_run7"),
//            SKTexture(imageNamed: "chiko_run8"),
//            SKTexture(imageNamed: "chiko_run9"),
//            SKTexture(imageNamed: "chiko_run10"),
//        ], timePerFrame: 0.1)))
        
        
        
        
//        let sprite2 = SKSpriteNode(color: .yellow, size: .init(width: 100, height: 100))
//        self.addChild(sprite2)
//        sprite2.position = CGPoint(x: 0, y: -200)
        
//        sprite2.run(.repeatForever(.rotate(byAngle: 2, duration: 2)))
        
        
//    }
}


extension GameScene: SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "garoto" || contact.bodyB.node?.name == "garoto"{
//            print("houve contato")
            // TODO: Go to next scene
            self.view?.presentScene(BattleScene(), transition: .fade(withDuration: 1.5))
        }
    }
}
