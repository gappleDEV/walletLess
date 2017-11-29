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
    
    @IBOutlet weak var l_mail: UILabel!
    @IBOutlet weak var l_home: UILabel!
    @IBOutlet weak var l_cards: UILabel!
    
    @IBOutlet var areaView: UIView!
    
    let greenSelected:UIColor = UIColor(red:0.09, green:0.63, blue:0.52, alpha:1.0)
    let greyUnselected:UIColor = UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0)
    
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
        switch sender.tag {
        case 0: // mail
            b_mail.setImage(UIImage(named: "tab_mailSelected"), for: .normal)
            l_mail.textColor = greenSelected
            b_home.setImage(UIImage(named: "tab_home"), for: .normal)
            l_home.textColor = greyUnselected
            b_cards.setImage(UIImage(named: "tab_card"), for: .normal)
            l_cards.textColor = greyUnselected
            
            let v1: View1 = View1(nibName: "View1", bundle: nil)
            self.addChildViewController(v1)
            v1.view.frame = CGRect(x: 0, y: 0, width: areaView.frame.width, height: areaView.frame.height)
            self.areaView.addSubview(v1.view)
            v1.didMove(toParentViewController: self)
            
        case 1:
            b_home.setImage(UIImage(named: "tab_homeSelected"), for: .normal)
            l_home.textColor = greenSelected
            b_mail.setImage(UIImage(named: "tab_mail"), for: .normal)
            l_mail.textColor = greyUnselected
            b_cards.setImage(UIImage(named: "tab_card"), for: .normal)
            l_cards.textColor = greyUnselected
        case 2:
            b_cards.setImage(UIImage(named: "tab_cardSelected"), for: .normal)
            l_cards.textColor = greenSelected
            b_mail.setImage(UIImage(named: "tab_mail"), for: .normal)
            l_mail.textColor = greyUnselected
            b_home.setImage(UIImage(named: "tab_home"), for: .normal)
            l_home.textColor = greyUnselected
        default:
            print("Something went wrong")
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
