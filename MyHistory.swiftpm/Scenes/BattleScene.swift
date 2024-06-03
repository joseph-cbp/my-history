//
//  File.swift
//  
//
//  Created by Joseph Pereira on 17/05/24.
//

import Foundation
import SpriteKit

enum ExistsLifePoints: Error{
    case noExists
}

class BattleScene: SKScene {
    
    private var player: Player!
    private var playerLifeBar: LifeBar!
    
    private var galinha: Player!
    private var galinhaLifeBar: LifeBar!
    
    private var menu: MenuClass!
    private var attackMenu: AttackMenu!
    
    private var textLabel: TextLabel!
    private var pedra: SKSpriteNode! = SKSpriteNode(imageNamed: "Pedra")
    private var milho: SKSpriteNode! = SKSpriteNode(imageNamed: "Milho")
    private var aumentar: SKSpriteNode!
    
    private let background = SKSpriteNode(imageNamed: "Background2")
    
    
    public override init() {
        super.init(size: .init(width: 1920, height: 1080))
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
    }
    
    public func setBackground(){
        self.background.position = CGPoint(x: 0, y: 0)
        self.background.zPosition = -1
        self.background.size = self.size
        addChild(self.background)
    }
    
    func addPlayer(){
        let player = Player(image: SKSpriteNode(imageNamed: "Garoto_r0"), animationStand: addTextures(quantity: 1, prefix: "Garoto_r"), animationRun: addTextures(quantity: 1, prefix: "Garoto_r"))
        player.char?.image.position = CGPoint(x: -500, y: 200)
        self.player = player
        addChild(self.player.char!)
    }
    
    func addGalinha(){
        let galinha = Player(image: SKSpriteNode(imageNamed: "Galinha_f0"), animationStand: addTextures(quantity: 1, prefix: "Galinha_a"), animationRun: addTextures(quantity: 3, prefix: "Galinha_at"))
        galinha.char?.image.position = CGPoint(x: 500, y: 200)
        galinha.char?.image.size = CGSize(width: -galinha.char.image.size.width, height: galinha.char.image.size.height)
        self.galinha = galinha
        addChild(self.galinha.char!)
    }
    
    func addControle(){
        self.menu = MenuClass(texture: nil, color: UIColor(white: 0.0, alpha: 0.0), size: CGSize(width: self.size.width, height: self.size.height/2))
        addChild(self.menu)
    }
    
    func addMenuAttack(){
        self.attackMenu = AttackMenu(texture: nil, color: UIColor(white: 0.0, alpha: 0.0), size: CGSize(width: self.size.width, height: self.size.height/2))
        self.attackMenu.isHidden = true
        self.attackMenu.textoDaLabel = "O que fazer ?"
        addChild(self.attackMenu)
    }
    
    func addTextLabel(){
        self.textLabel = TextLabel(texture: nil, color: .gray, size: CGSize(width: self.size.width, height: (self.size.height/2) * 0.3))
        self.textLabel.position = CGPoint(x: 0, y: -70)
        addChild(self.textLabel)
    }
    
    func addGalinhaLifeBar(){
        self.galinhaLifeBar = LifeBar(qtd: self.galinha.vida)
        self.galinhaLifeBar.position = CGPoint(x: 300, y: 370)
        addChild(self.galinhaLifeBar)
        
    }
    
    func addPlayerLifeBar(){
        self.playerLifeBar = LifeBar(qtd: 5)
        self.playerLifeBar.position = CGPoint(x: -700, y: 370)
        addChild(self.playerLifeBar)
        
    }
    
    override func sceneDidLoad() {
        setBackground()
        addPlayer()
        addGalinha()
        addControle()
        addMenuAttack()
        addGalinhaLifeBar()
        addPlayerLifeBar()
        addTextLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func jogarAlgo(algo: SKSpriteNode!){
        let actionRotate = SKAction.rotate(byAngle: 180, duration: 0.5)
        let actionMove1 = SKAction.move(to: CGPoint(x: 50, y: 300), duration: 0.5)
        let actionMove2 = SKAction.move(to: CGPoint(x: 500, y: 90), duration: 0.5)
        let group1 = SKAction.group([actionRotate, actionMove1])
        let group2 = SKAction.group([actionRotate, actionMove2])
        algo.position = CGPoint(x: -500, y: 200)
        addChild(algo)
        
        algo.run(.sequence([
            group1,
            group2
        ]))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.01){
            if let unAlgo = algo{
                self.removeChildren(in: [unAlgo])
            }
        }
    }
    
    func delayFunc(duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration){
            self.textLabel.text = "O que fazer ?"
            self.menu.isHidden = false
            self.galinha.char.setState(inGame: .stand)
        }
    }
    
    func callWithDelay(duration: Double, function: @escaping ()->()){
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: function)
    }
    
    func tryToRun(){
        if !self.player.fuga {
            self.textLabel.text = "Tentou fugir"
            self.menu.isHidden = true
            self.player.char.setState(inGame: .playerJump)
            self.galinha.char.setState(inGame: .galinhaJump)
            self.delayFunc(duration: 1.3)
        } else {
            self.view?.presentScene(FinalScene(text: "Você Fugiu!"), transition: .fade(withDuration: 1.5))
        }
    }
    
    func playerAttackJogarPedra(){
        self.attackMenu.isHidden = true
        self.textLabel.text = "Você jogou uma pedra"
        self.player.char.setState(inGame: .playerJump)
        self.jogarAlgo(algo: self.pedra)
        
 self.galinhaLifeBar.removeLifePoint(qtd: self.player.ataque(BattleChar: galinha))

        self.galinha.modificarCoragem(modificador: 1)
    }
    
    func playerAttackJogarMilho(){
        self.attackMenu.isHidden = true
        self.textLabel.text = "Jogou o Milho"
        self.player.char.setState(inGame: .playerJump)
        self.jogarAlgo(algo: self.milho)
        self.player.fugir()
    }
    
    func galinhaBicar(){
        
        self.playerLifeBar.removeLifePoint(qtd: self.galinha.ataque(BattleChar: player))
        self.galinha.char.setState(inGame: .galinhaBicar)
        self.textLabel.text = "Galinha bicou você"
    }
    func galinhaDistraida(){
        self.galinha.char.setState(inGame: .galinhaJump)
        self.textLabel.text = "Galinha está distraida"
    }
    func galinhaFuria(){
        self.textLabel.text = "Galinha ficou furiosa, dano aumentou"
        self.galinha.char.setState(inGame: .galinhaJump)
        aumentarDano()
    }
    
    func aumentarDano(){
        let textures = addTextures(quantity: 2, prefix: "Increase_")
        self.aumentar = SKSpriteNode(imageNamed: "Increase_0")
        self.aumentar.position = CGPoint(x: 600, y: 200)
        self.aumentar.setScale(0.5)
        addChild(self.aumentar)
        self.aumentar.run(.repeatForever(.animate(with: textures, timePerFrame: 0.15)))
    }
    
    func verifyLifePoints(){
        if self.playerLifeBar.lifeIsEmpty() {
            self.view?.presentScene(FinalScene(text: "Galinha Venceu"), transition: .fade(withDuration: 1.5))
        }
    }
    
    func attackList(attack: String){
            switch attack{
            case "attackButton":
                self.menu.isHidden = true
                self.attackMenu.isHidden = false
            case "runButton":
                tryToRun()
            case "attack1":
                playerAttackJogarPedra()
                callWithDelay(duration: 1, function: galinhaFuria)
                callWithDelay(duration: 2, function: galinhaBicar)
                callWithDelay(duration: 2.1) {
                    self.removeChildren(in: [self.aumentar])
                }
                callWithDelay(duration: 4.4, function: verifyLifePoints)
                delayFunc(duration: 4.5)
            case "attack2":
                playerAttackJogarMilho()
                callWithDelay(duration: 1, function: galinhaDistraida)
                delayFunc(duration: 3.5)
            case "attack3":
                print("Ataque 3")
            default:
                break
            }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            let touchedNode = atPoint(touchLocation)
            if let nodeName = touchedNode.name {
                attackList(attack: nodeName)
            }
        }
    }
    
}
