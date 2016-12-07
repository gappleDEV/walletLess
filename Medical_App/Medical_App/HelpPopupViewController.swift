//
//  HelpPopupViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 12/6/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

class HelpPopupViewController: UIViewController {
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var l_helpText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.l_helpText.text = gl_data.helpText
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.boxView.layer.cornerRadius = self.boxView.frame.width/8
        self.boxView.layer.shadowColor = UIColor.black.cgColor
        self.boxView.layer.shadowOpacity = 1
        self.boxView.layer.shadowOffset = CGSize.zero
        self.boxView.layer.shadowRadius = 10
        
        self.showAnimate()
        // Do any additional setup after loading the view.
    }
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if(finished)
            {
                self.view.removeFromSuperview()
            }
        })
        
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
