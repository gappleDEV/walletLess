//
//  TabBarController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 11/28/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class TabBarController: UIViewController {
    
    @IBOutlet weak var l_title: UILabel!
    @IBOutlet weak var l_date: UILabel!
    @IBOutlet weak var tabHolder: UIView!
    
    @IBOutlet weak var b_mail: UIButton!
    @IBOutlet weak var b_home: UIButton!
    @IBOutlet weak var b_cards: UIButton!
    
    //holds the labels for each button [mail, home, cards]
    @IBOutlet var buttonLabels: Array<UILabel>!
    
    //view that is filled depending on which tab is selected
    @IBOutlet var areaView: UIView!
    
    let greenSelected:UIColor = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
    let greyUnselected:UIColor = UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0)
    
    private let backImageView: [UIImageView] = [UIImageView(image: UIImage(named: "tab_mailSelected")), UIImageView(image: UIImage(named: "tab_homeSelected")), UIImageView(image: UIImage(named: "tab_cardSelected"))]
    private let frontImageView: [UIImageView] = [UIImageView(image: UIImage(named: "tab_mail")), UIImageView(image: UIImage(named: "tab_home")), UIImageView(image: UIImage(named: "tab_card"))]
    private var showingBack: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabHolder.layer.cornerRadius = 8
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
        l_date.text = dateFormatterPrint.string(from: Date())
        
        self.tabButtonPressed(b_home)
    }
    
    @IBAction func tabButtonPressed(_ sender: UIButton) {
        b_mail.setImage(UIImage(named: "tab_mail"), for: .normal)
        buttonLabels[0].textColor = greyUnselected
        b_home.setImage(UIImage(named: "tab_home"), for: .normal)
        buttonLabels[1].textColor = greyUnselected
        b_cards.setImage(UIImage(named: "tab_card"), for: .normal)
        buttonLabels[2].textColor = greyUnselected
        
        UIView.transition(with: sender, duration: 0.25, options: .transitionFlipFromLeft, animations: {
            sender.setImage(self.backImageView[sender.tag].image, for: .normal)
            self.buttonLabels[sender.tag].textColor = self.greenSelected
        }, completion: { _ in
            switch sender.tag {
            case 0: // mail
                self.clearSubViewControllers()
                let v1: View1 = View1(nibName: "View1", bundle: nil)
                self.addChildViewController(v1)
                v1.view.frame = CGRect(x: 0, y: 0, width: self.areaView.frame.width, height: self.areaView.frame.height)
                self.areaView.addSubview(v1.view)
                v1.didMove(toParentViewController: self)
                
            case 1:
                print("home")
                self.clearSubViewControllers()
                let v1: MenuCollectionViewController = MenuCollectionViewController(nibName: "MenuCollectionViewController", bundle: nil)
                self.addChildViewController(v1)
                self.areaView.addSubview(v1.view)
                v1.didMove(toParentViewController: self)
                
            case 2:
                print("cards")
                self.clearSubViewControllers()
            default:
                print("Something went wrong")
            }
        })
        
        
    }
    
    func clearSubViewControllers() {
        if self.childViewControllers.count > 0 {
            let controllers:[UIViewController] = self.childViewControllers
            for vc in controllers {
                vc.willMove(toParentViewController: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParentViewController()
            }
        }
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
