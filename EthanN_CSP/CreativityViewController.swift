//
//  CreativityViewController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 12/7/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

public class CreativityViewController : UICollectionViewCell, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
            UIImage(named: "HotDog"),
        ]
    }()
    
    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
// START HERE ON THE CODE
        }
    }
}
