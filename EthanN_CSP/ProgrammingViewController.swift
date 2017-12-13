//
//  ProgrammingViewController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 12/13/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import Foundation
import SpriteKit

public class ProgrammingViewController: UIViewController
{
    //MARK: UI Components
    
    override public func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        let gameScene = StartScene(size: view.bounds.size) // Is the cene "certain ammount" big?
        let gameView= view as! SKView
        
        gameView.showsFPS = true // shows FPS...
        gameView.showNodeCount = true // Can see how many nodes are in active use..
        gameView.ignoresSiblingOrder = true // Telling the scene the order or defining which node is not important.
        
        gameScene.scaleMode = .resizeFill // Resize to fill the window
        gameView.presentScene(gameScene) // Telling the view to show this scene - Must have this.
        
    }
}
