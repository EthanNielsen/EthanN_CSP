//
//  Player.swift
//  Sample_CSP
//
//  Created by Cody Henrichsen on 12/7/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import SpriteKit

public class Player: SKSpriteNode
{
    private var canFire : Bool = true

    private var invincible = false
    private var lives:Int = 3
    {
        // The rules of lies, if I lose all my lifes I die but if I have a life then I respawn.
        didSet
        {
            if(lives < 0)
            {
                kill()
            }
            else
            {
                respawn()
            }
        }
    }

    
    public init()
    {
        // This is the constructor, this doesn't animate it creates the stuff needed for it.
        let texture = SKTexture(imageNamed: "x wing1")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        // creates the rules for the players model. (x wing)
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = false
        self.physicsBody?.categoryBitMask = CollisionCategories.Player
        self.physicsBody?.contactTestBitMask = CollisionCategories.InvaderBullet | CollisionCategories.Invader
        self.physicsBody?.collisionBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.allowsRotation = false // Player doesn't rotate
        animate()
        
        
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func animate() -> Void
    {
        // This is the animation code. Its what tells the x wing to change colors
        var playerTextures:[SKTexture] = []
        for i in 1...3 // changes from picture 1 then 2 then 3
        {
            playerTextures.append(SKTexture(imageNamed: "x wing\(i)"))
        }
        
        let playerAnimation = SKAction.repeatForever( SKAction.animate(with: playerTextures, timePerFrame: 0.2)) // It will animate every 2/10's of a second and will never stop.
        self.run(playerAnimation)
    }
    
    public func die () -> Void
    {
        if(!invincible)
        {
            lives -= 1
        }
    }
    
    public func kill() -> Void
    {
        gameLevel = 1
        
        let gameOverScene = DeathScene(size: self.scene!.size)
        gameOverScene.scaleMode = self.scene!.scaleMode
        let transitionType = SKTransition.flipHorizontal(withDuration: 1)
        self.scene!.view!.presentScene(gameOverScene, transition: transitionType)
        
    }
    
    // Gives a little bit in invincibility after you die
    public func respawn() -> Void
    {
        invincible = true
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.4)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.4)
        let fadeOutIn = SKAction.sequence([fadeOutAction, fadeInAction])
        let fadeOutInAction = SKAction.repeat(fadeOutIn, count: 5)
        let setInvicibleFalse = SKAction.run()
        {
            self.invincible = false
        }
        run(SKAction.sequence([fadeOutInAction,setInvicibleFalse]))
    }
    
    // Code to fire a bullet from the player
    public func fireBullet(scene: SKScene) -> Void
    {
        if(!canFire)
        {
            return
        }
        else
        {
            // Code below is what fires the bullet
            canFire = false
            let bullet = PlayerLaser(imageName: "laser", bulletSound: "laser sound.mp3")
            bullet.position.x = self.position.x
            bullet.position.y = self.position.y + self.size.height / 2
            scene.addChild(bullet)
            let moveBulletAction = SKAction.move(to:CGPoint(x:self.position.x,y:scene.size.height + bullet.size.height), duration: 1.0) // This is how fast the bullet goes
            let removeBulletAction = SKAction.removeFromParent()
            bullet.run(SKAction.sequence([moveBulletAction,removeBulletAction]))
            let waitToEnableFire = SKAction.wait(forDuration: 0.5) // This is how fast the gun fires
            run(waitToEnableFire,completion:
                {
                    self.canFire = true
                })
        }
    }

}














