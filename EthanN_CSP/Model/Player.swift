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
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = false
        self.physicsBody?.categoryBitMask = CollisionCategories.Player
        self.physicsBody?.contactTestBitMask = CollisionCategories.InvaderBullet | CollisionCategories.Invader
        self.physicsBody?.collisionBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.allowsRotation = false
        animate()
        
        
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func animate() -> Void
    {
        
    }
    
    public func die () -> Void
    {
        
    }
    
    public func kill() -> Void
    {
    
    }
    
    public func respawn() -> Void
    {
        
    }
    
    public func fireBullet(scene: SKScene) -> Void
    {
        
    }

}
