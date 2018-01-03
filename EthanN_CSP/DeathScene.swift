//
//  DeathScene.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 12/19/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit
import SpriteKit

public class DeathScene : SKScene
{
    override public func didMove(to view: SKView) -> Void
    {
        self.backgroundColor = SKColor.red
        
        // This is the death text
        let gameOver = SKLabelNode(text: "👆😳👆Dead👇😂👇")
        gameOver.name = "game over"
        gameOver.fontSize = 50
        gameOver.fontColor = SKColor.white
        gameOver.position = CGPoint(x: frame.midX, y: frame.midY)
        
        addChild(gameOver)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> Void
    {
        let touch = touches.first
        let touchLocation = touch?.location(in: self)
        let touchedNode = self.atPoint(touchLocation!)
        if(touchedNode.name == "game over")
        {
            let newGameScene = GameScene(size: size)
            newGameScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
            view?.presentScene(newGameScene, transition: transitionType)
        }
    }
}
