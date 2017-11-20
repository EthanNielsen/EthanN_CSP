//
//  Cheese.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 11/20/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import Foundation
public class Cheese : Crushable
{
    public var crushState: Bool
    
    public init()
    {
        self.crushState = false
    }
    
    //MARK:- Crushable methods
    public func crush() -> Void
    {
        print("Help Im being Crushed!")
        crushState = true
    }
    
    public func isCrushed() -> Bool
    {
        if(crushState)
        {
            print("Crushed")
        }
        else
        {
            print("Few.. That was close")
        }
        return crushState
    }
}
