//
//  AbstractionViewController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 11/27/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import Foundation

public class AbstractionViewControlle: UIPageViewController, UIPageViewControllerDataSource
{
    
    private (set) lazy var orderedAstractionViews : [UIViewController] =
    {
        return [
            self.newAbstractionViewController(abstractionLevel: "Block"),
            self.newAbstractionViewController(abstractionLevel: "Java"),
            self.newAbstractionViewController(abstractionLevel: "ByteCode"),
            self.newAbstractionViewController(abstractionLevel: "Binary"),
            self.newAbstractionViewController(abstractionLevel: "AndGate"),
        ]
    }()

    private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
    {
        
    }
    
    override public func viewDidLoad()
    {
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore
        viewController: UIViewController) -> UIViewController?
    {
        
    }

}
