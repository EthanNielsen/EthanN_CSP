//
//  Invader.swift
//  Sample_CSP
//
//  Created by Cody Henrichsen on 12/6/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import SpriteKit

public class Invader: SKSpriteNode
{
    var invaderRow : Int = 0
    var invaderCol : Int = 0
 
    
    //MARK: - Initializers
    public init()
    {
        let texture = SKTexture(imageNamed: "enemy1")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "invader"
        
        // This is how stuff or the bodies interacts with one another through the invader.
        self.physicsBody =
            SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = false
        self.physicsBody?.categoryBitMask = CollisionCategories.Invader // Says what I am
        self.physicsBody?.contactTestBitMask = CollisionCategories.PlayerBullet | CollisionCategories.Player // Checks to see if I touchd you
        self.physicsBody?.collisionBitMask = CollisionCategories.EdgeBody
    
    }
    // Required init must be provided by subclass
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Invader methods section
    public func fireBullet(scene: SKScene) -> Void
    {

    }
}
