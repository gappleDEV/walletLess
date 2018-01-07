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
    
    let greenBrand:UIColor = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
    fileprivate var bgColor: [UIColor] = []
    fileprivate let icons: [UIImage] = [UIImage(named: "user_grey")!, UIImage(named: "health_book_grey")!, UIImage(named: "police_grey")!]
    fileprivate let titles: [String] = ["Personal Information", "Insurance Information", "Police Search"]
    fileprivate var cellsIsOpen = [Bool]()
    
    var selectedView:UIView?
    let transition = PopAnimator()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.collectionView!.alpha = 1
        }) { (_) in
            print("Finished fading in")
        }
    }
    
    override func viewDidLoad() {
        itemSize = CGSize(width: 225, height: 275)
        super.viewDidLoad()
        
        // initialize background colors
        self.bgColor = Array(repeating: greenBrand, count: titles.count)
        
        // register cell
        registerCell()
        // initialie open array
        fillCellIsOpenArray()
        // add gesture recognizer
        addGesture(to: collectionView!)
        // setting up for animation
        self.collectionView!.alpha = 0
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
        cellsIsOpen = Array(repeating: false, count: titles.count)
    }
    
    fileprivate func getViewController() -> ExpandingTableViewController {
        print("called")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toViewController: PersonalInfoTableViewController = storyboard.instantiateViewController(withIdentifier: "PersonalInfoTableViewController") as! PersonalInfoTableViewController
        return toViewController
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
            pushToViewController(getViewController())
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
        return titles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? MenuCollectionViewCell else { return }
        
        let index = indexPath.row % titles.count
        let bg = bgColor[index]
        let icon = icons[index]
        let title = titles[index]
        //set up cell
        cell.frontContainerView.backgroundColor = bg
        cell.i_icon.image = icon
        cell.l_title.text = title
        cell.cellIsOpen(cellsIsOpen[index], animated: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuCollectionViewCell.self), for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell
            , currentIndex == indexPath.row else { return }
        
        // Used for the pop animation
        selectedView = cell.frontContainerView
        
        if cell.isOpened == false {
            cell.cellIsOpen(true)
        } else {
            //pushToViewController(getViewController())
            let v1: View3 = View3(nibName: "View3", bundle: nil)
            v1.transitioningDelegate = self
            self.present(v1, animated: true) {
                print("Done moving to nib")
            }
            print("open fully - here")
            
            /*if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
             rightButton.animationSelected(true)
             }*/
        }
    }
}

extension MenuCollectionViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting:
        UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = selectedView!.superview!.convert(selectedView!.frame, to: nil)
        transition.presenting = true
        //selectedView!.isHidden = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}

