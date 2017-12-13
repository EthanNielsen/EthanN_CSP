//
//  GameComponents.swift
//  Sample_CSP
//
//  Created by Cody Henrichsen on 12/6/17.
//  Copyright © 2017 CTEC. All rights reserved.
//
import Foundation


var gameLevel : Int = 1 // Seperate data value from the class and referenced exterally


struct CollisionCategories // Static variables / constants / This is the way spritekits handles collitions.
{
    static let Invader : UInt32 = 0x1 << 0
    static let Player: UInt32 = 0x1 << 1
    static let InvaderBullet: UInt32 = 0x1 << 2
    static let PlayerBullet: UInt32 = 0x1 << 3
    static let EdgeBody: UInt32 = 0x1 << 4
}

extension Array // Adds functionality to what swift provides.
{
    public func randomElement() -> Element? // Allows us to grab random values in an array.
    {
        if self.count == 0
        {
            return nil
        }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
