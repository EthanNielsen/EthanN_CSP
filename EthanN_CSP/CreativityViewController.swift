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
    
    
    //This area displayes the images in cells.
    //MARK: Lifecycle methods
    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK:- UICollectionView methods
    
    override public func numberOfSelections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollecctionView,
                                        numberOfItemsInSection section: Int) -> Int
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionView
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .magenta
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
    
    //MARK:- Delegate Methods
    
    public 
    
    
    
    
    
}
