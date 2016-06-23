//
//  GameScene.swift
//  FlappyBird
//
//  Created by Kamil Wójcik on 23.06.2016.
//  Copyright (c) 2016 Kamil Wójcik. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode() //tworzymy węzeł
    
    var bg = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        
        
        let przesuńBg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        let zastąpBg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        let przesuńBgNaZawsze = SKAction.repeatActionForever(SKAction.sequence([przesuńBg, zastąpBg]))
        
        
        for var i: CGFloat = 0; i<3; i++ {
            bg = SKSpriteNode(texture: bgTexture)
            
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame))
            
            bg.size.height = self.frame.height
            
            bg.runAction(przesuńBgNaZawsze)

            self.addChild(bg)

        }
        
       
        var birdTexture1 = SKTexture(imageNamed: "bird1.png") //nie robimy image tylko zamiast jest texture
        let birdTexture2 = SKTexture(imageNamed: "bird2.png") //dodajemy drugiego ptaszka
        let birdTexture3 = SKTexture(imageNamed: "bird3.png") //dodajemy drugiego ptaszka

        
        let animacja = SKAction.animateWithTextures([birdTexture1, birdTexture2, birdTexture3], timePerFrame: 0.1) //pozwala nam robić różne rzeczy z węzłami
        let loopAnimacjiPtaszków = SKAction.repeatActionForever(animacja) //loopojemy na zawsze
        
        bird = SKSpriteNode(texture: birdTexture1)
        bird.setScale(2)
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))//musimy powiedziec xcodowi gdzie wsadzić go, cgrectmid daje nam wspolrzedne srodka frame'u czyli naszego telefonu**
        
        bird.runAction(loopAnimacjiPtaszków)//uruchamiamy animacje
        
        self.addChild(bird) //tak dodajemy węzeł do widoku
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
