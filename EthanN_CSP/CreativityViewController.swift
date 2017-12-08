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
    
    // Click on a photo and this code makes it big.
    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates(
                {
                    self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath,
                                                      at: .centeredVertically,
                                                      animated: true)
                }
            }
        }
    }
}
