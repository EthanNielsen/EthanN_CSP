//
//  GameScene.swift
//  Sample_CSP
//
//  Created by Cody Henrichsen on 12/6/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion

public class GameScene: SKScene, SKPhysicsContactDelegate // Main controller for the game.
{
    //MARK: Invader Data
    let rowsOfInvaders : Int = 4
    var invaderSpeed : Int = 2 // have some fun with this ;)
    var invadersThatCanFire : [Invader] = []
    
    //MARK: Player Data
    var player : Player = Player()
    
    //MARK: Game Data
    let leftBounds : CGFloat = 30
    var rightBounds : CGFloat = 0
    
    let maxLevels = 3
    let motionManager: CMMotionManager = CMMotionManager() // Allows for turing the device/Phone and accounts for that in game.
    var accelerationX: CGFloat = 0.0
    
    //MARK:- Game Methods
    
    private func setupInvaders() -> Void
    {
        let numberOfInvaders = gameLevel * 2 + 1
        for invaderRow in 0..<numberOfInvaders
        {
            for invaderCol in 0..<numberOfInvaders
            {
                // Lets us see wich invader is on a certain row.
                let currentInvader :Invader = Invader()
                let halfWidth : CGFloat = currentInvader.size.width / 2
                let xPosition : CGFloat = size.width - halfWidth - (CGFloat(numberOfInvaders) * currentInvader.size.width) + 10// allows us to put each individual bad guy on the screen
                
                currentInvader.position = CGPoint(x: xPosition + (currentInvader.size.width + CGFloat(10)) * CGFloat(invaderCol - 1), y: CGFloat(self.size.height - CGFloat(invaderRow) * 46))
                currentInvader.invaderRow = invaderRow
                currentInvader.invaderCol = invaderCol
                
                addChild(currentInvader) // Puts a grid of invaders on the screen
                if (invaderRow == rowsOfInvaders)
                {
                    invadersThatCanFire.append(currentInvader)
                }
            }
        }
        
        
    }

    private func setupPlayer() -> Void
    {
        //Frame or bounds
        player.position = CGPoint(x:self.frame.midX, y:player.size.height/2 + 10) // Gives it a position on the screen.
        addChild(player)
    }
    
    private func moveInvaders() -> Void
    {
        var changeDirection = false
        enumerateChildNodes(withName: "invader")
        {
            //Closure parameters, this changes the direction of all the invaders at the left and right bounds of the screen. It then moves down after each direction change.
            node, stop in
            let invader = node as! SKSpriteNode
            let invaderHalfWidth = invader.size.width / 2
            invader.position.x -= CGFloat(self.invaderSpeed)
            if(invader.position.x > self.rightBounds - invaderHalfWidth || invader.position.x < self.leftBounds + invaderHalfWidth)
            {
                changeDirection = true
            }
            
        }
        
        if(changeDirection == true)
        {
            // code that makes it go dow the screen.
            self.invaderSpeed *= -1
            self.enumerateChildNodes(withName: "invader")
            {
                node, stop in
                let invader = node as! SKSpriteNode
                invader.position.y -= CGFloat(10)
            }
            changeDirection = false
        }
        
    }
    
    private func invokeInvaderFire() -> Void
    {
        
    }
    
    func fireInvaderBullet() -> Void
    {
        if(invadersThatCanFire.isEmpty)
        {
            gameLevel += 1
            levelComplete()
        }
        if let randomInvader = invadersThatCanFire.randomElement()
        {
            randomInvader.fireBullet(scene: self)
        }
    }
    
    func newGame() -> Void
    {
        let newGameScene = StartScene(size: size)
        newGameScene.scaleMode = scaleMode
        let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
        view?.presentScene(newGameScene, transition: transitionType)
    }
    
    func levelComplete() -> Void
    {
        if(gameLevel <= maxLevels)
        {
            let levelCompleteScene = LevelCompleteScene(size: size)
            levelCompleteScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
            view?.presentScene(levelCompleteScene, transition: transitionType)
        }
    }
    
    
    //MARK:- Scene methods
    
    override public func didMove(to view: SKView) -> Void
    {
        self.physicsWorld.gravity = CGVector(dx:0, dy:0)
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
        backgroundColor = UIColor.magenta
        rightBounds = self.size.width - 30
        setupInvaders()
        setupPlayer()
        invokeInvaderFire()
        setupAccelerometer()
        
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> Void
    {
       player.fireBullet(scene: self)
    }
    
    // updates 60 times per second.
    override public func update(_ currentTime: CFTimeInterval) -> Void
    {
        moveInvaders()
    }
    
    override public func didSimulatePhysics()
    {
        
    }

    //MARK:- Handle Motion
    func setupAccelerometer() -> Void
    {
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler:
            {
                (accelerometerData: CMAccelerometerData?, error: Error?)
                in
                    let acceleration = accelerometerData!.acceleration
                    self.accelerationX = CGFloat(acceleration.x)
                } )
    }
    
    
    //MARK:- SKPhysicsContactDelegate method
    
    // This is how we do the test collisions.
    public func didBegin(_ contact: SKPhysicsContact) -> Void
    {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask
        {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else
        {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // If Invader and PlayerBullet collided then print message...
        if ((firstBody.categoryBitMask & CollisionCategories.Invader != 0) && (secondBody.categoryBitMask & CollisionCategories.PlayerBullet != 0))
        {
            print("Invader and Player Bullet Contact")
        }
        // If player and InvaderBullet collided then print message....
        if ((firstBody.categoryBitMask & CollisionCategories.Player != 0) && (secondBody.categoryBitMask & CollisionCategories.InvaderBullet != 0))
        {
            print("Player and Invader Bullet Contact")
        }
        // If Invader and Player collided then print message...
        if ((firstBody.categoryBitMask & CollisionCategories.Invader != 0) && (secondBody.categoryBitMask & CollisionCategories.Player != 0))
        {
            print("Invader and Player Collision Contact")
        }
        
        
    }
    
}
















