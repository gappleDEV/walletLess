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
    
    internal let cellDefaultHeight:CGFloat = 60.0
    internal let cellExpandedHeight:CGFloat = 225.0
    
    internal var categories = ["Health Insurance", "Car Insurance", "Prescription"]
    internal var heights:[CGFloat] = []
    internal var subArrTypes = [User(email: "email@gmail.com", password: "pass"), User(), User()]
    
    internal let cellIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        heights = Array(repeating: cellDefaultHeight, count: categories.count)
        
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
        return categories.count
    }
    
    //Creates the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = t_categories.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryTableViewCell
        
        cell.l_title.text = categories[indexPath.row]
        cell.setTableData(tableData: subArrTypes[indexPath.row])
        
        return cell
    }
    
    //Height for a given cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath.row]
    }
    
    //Selecting a specific row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Begin animated updates
        self.t_categories.beginUpdates()
        //Change of of selected row
        heights[indexPath.row] = heights[indexPath.row] == cellDefaultHeight ? cellExpandedHeight : cellDefaultHeight
        //End the animated updates
        self.t_categories.endUpdates()
    }
    
}
