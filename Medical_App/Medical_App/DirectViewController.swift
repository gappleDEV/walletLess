//
//  DirectViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 11/14/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class DirectViewController: UIViewController {

    @IBOutlet var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let v1: LoginViewController_v2 = LoginViewController_v2(nibName: "LoginViewController_v2", bundle: nil)
        v1.modalTransitionStyle = .crossDissolve
        self.present(v1, animated: true) {
            print("Done moving to nib")
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
