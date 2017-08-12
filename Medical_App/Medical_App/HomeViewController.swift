//
//  HomeViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var t_categories: UITableView!
    
    let names = ["Health Insurance", "Car Insurance", "Prescription"]
    let subArr = ["Field 1", "Value 1"]
    
    let cellIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        t_categories.delegate = self
        t_categories.dataSource = self
        print("In view")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = t_categories.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryTableViewCell
        
        cell.l_title.text = names[indexPath.row]
        //cell.setParams(categoryTitle: names[indexPath.row], fields: ["Email", "First Name", "Middle Name", "Last Name"], values: user.toArray())
        
        return cell
    }
}
