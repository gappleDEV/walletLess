//
//  CollectionViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 7/23/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

class DataToLaunch
{
    var thumbnail:UIImage?
    var storyboardId:String
    
    init (storyboardId:String) {
        self.storyboardId = storyboardId
    }
}

struct Section
{
    let title:String
    let items:[DataToLaunch]
}

class CollectionViewController: UICollectionViewController
{

    private let reuseIdentifier = "dataCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let numSections = 1
    private let numItems = 1
    private var sections = [Section]()
    
    override func viewDidLoad() {
        sections.append(Section(title: "Personal Info", items: [DataToLaunch(storyboardId: "PersonalInfo")]))
        sections.append(Section(title: "Insurance Info", items: [DataToLaunch(storyboardId: "PersonalInfo")]))
    }
    
    func itemForIndexPath(indexPath: NSIndexPath) -> DataToLaunch
    {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sections[section].items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        
       /* let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let cellWidth = viewWidth * 0.4
        let cellHeight = viewHeight * 0.1
        cell.frame = CGRectMake((viewWidth - cellWidth) * 0.5, viewHeight * 0.1 - cellHeight * 0.5 + 100, cellWidth, cellHeight)*/
        
        // Configure the cell
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier(sections[indexPath.section].items[indexPath.row].storyboardId)
        self.presentViewController(nextViewController, animated:false, completion:nil)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        switch kind
        {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CollectionHeaderView", forIndexPath: indexPath) as! CollectionHeaderView
            headerView.l_header.text = sections[indexPath.section].title
            headerView.alpha = 0.8
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

