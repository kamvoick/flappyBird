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
    
    var rura1 = SKSpriteNode()
    
    var rura2 = SKSpriteNode()
    
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
        
        var rura1Texture = SKTexture(imageNamed: "rura1.png")
        var rura1 = SKSpriteNode(texture: rura1Texture)
        rura1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)+300)
        rura1.setScale(3)
        
        self.addChild(rura1)
        
        
        var rura2Texture = SKTexture(imageNamed: "rura2.png")
        var rura2 = SKSpriteNode(texture: rura2Texture)
        rura2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)-300)
        rura2.setScale(3)

        self.addChild(rura2)
        
       
        let birdTexture1 = SKTexture(imageNamed: "ptak1.png") //nie robimy image tylko zamiast jest texture
        let birdTexture2 = SKTexture(imageNamed: "ptak2.png") //dodajemy drugiego ptaszka
        let birdTexture3 = SKTexture(imageNamed: "ptak3.png") //dodajemy drugiego ptaszka

        
        let animacja = SKAction.animateWithTextures([birdTexture1, birdTexture2, birdTexture3], timePerFrame: 0.15) //pozwala nam robić różne rzeczy z węzłami
        let loopAnimacjiPtaszków = SKAction.repeatActionForever(animacja) //loopojemy na zawsze
        
        
        
        bird = SKSpriteNode(texture: birdTexture1)
        bird.setScale(3)
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))//musimy powiedziec xcodowi gdzie wsadzić go, cgrectmid daje nam wspolrzedne srodka frame'u czyli naszego telefonu**
        
        bird.runAction(loopAnimacjiPtaszków)//uruchamiamy animacje
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture1.size().height/2)
        bird.physicsBody!.dynamic = true //dodajemy grawitacje
        
        
        
        self.addChild(bird) //tak dodajemy węzeł do widoku
        
        var ziemia = SKNode()
        ziemia.position = CGPointMake(0, 0)
        ziemia.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ziemia.physicsBody?.dynamic = false //nie chcemy grawitacji 
        
        self.addChild(ziemia)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        bird.physicsBody!.velocity = CGVectorMake(0, 0)
        bird.physicsBody?.applyImpulse(CGVectorMake(0, 2))//musimy dodać impulsy
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
