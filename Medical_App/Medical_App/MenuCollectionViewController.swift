//
//  MenuCollectionViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 11/29/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import expanding_collection

class MenuCollectionViewController: ExpandingViewController {
    
    fileprivate let items: [UIColor] = [.black, .blue, .red]
    fileprivate var cellsIsOpen = [Bool]()
    
    override func viewDidLoad() {
        itemSize = CGSize(width: 225, height: 300)
        super.viewDidLoad()
        
        // register cell
        registerCell()
        // initialie open array
        fillCellIsOpenArray()
        // add gesture recognizer
        addGesture(to: collectionView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: Helpers
extension MenuCollectionViewController {
    
    fileprivate func registerCell() {
        let nib = UINib(nibName: String(describing: MenuCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: MenuCollectionViewCell.self))
    }
    
    fileprivate func fillCellIsOpenArray() {
        cellsIsOpen = Array(repeating: false, count: items.count)
    }
}

/// MARK: Gesture
extension MenuCollectionViewController {
    
    fileprivate func addGesture(to view: UIView) {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(MenuCollectionViewController.swipeHandler(_:)))
        swipeUp.direction = .up
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(MenuCollectionViewController.swipeHandler(_:)))
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        let indexPath = IndexPath(row: currentIndex, section: 0)
        guard let cell = collectionView?.cellForItem(at: indexPath) as? MenuCollectionViewCell else { return }
        // double swipe Up transition
        if cell.isOpened == true && sender.direction == .up {
            //pushToViewController(getViewController())
            print("open fully")
            
            /*if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(true)
            }*/
        }
        
        let open = sender.direction == .up ? true : false
        cell.cellIsOpen(open)
        cellsIsOpen[indexPath.row] = cell.isOpened
    }
    
}

// MARK: UICollectionViewDataSource
extension MenuCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? MenuCollectionViewCell else { return }
        
        let index = indexPath.row % items.count
        let info = items[index]
        //set up cell
        cell.frontContainerView.backgroundColor = info
        cell.cellIsOpen(cellsIsOpen[index], animated: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuCollectionViewCell.self), for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
            , currentIndex == indexPath.row else { return }
        
        if cell.isOpened == false {
            cell.cellIsOpen(true)
        } else {
            //pushToViewController(getViewController())
            print("open fully")
            
            /*if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
             rightButton.animationSelected(true)
             }*/
        }
    }
    
}

