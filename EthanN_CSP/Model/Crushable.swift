//
//  Crushable.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 11/20/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import Foundation
public protocol Crushable
{
    var crushState :Bool {get set}
    func crush() -> Void
    func isCrushed() -> Bool
}
