//
//  CategoryTableViewCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    //Properties
    @IBOutlet weak var l_title: UILabel!
    @IBOutlet weak var b_help: UIButton!
    @IBOutlet weak var b_edit: UIButton!
    @IBOutlet weak var t_values: UITableView!
    
    let cellIdentifier = "ValuesTableViewCell"
    
    var categoryTitle = ""
    var fields:[String] = []
    var values:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        t_values.delegate = self
        t_values.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setParams(categoryTitle: String, fields: [String], values: [String]) {
        self.categoryTitle = categoryTitle
        self.fields = fields
        self.values = values
    }
    
    // Created the cell to put at an index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = t_values.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ValuesTableViewCell
        
        cell.l_field.text = fields[indexPath.row]
        cell.l_value.text = values[indexPath.row]
        
        return cell
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
