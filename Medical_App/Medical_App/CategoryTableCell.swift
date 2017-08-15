//
//  CategoryTableViewCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewCell: UITableViewCell, UITableViewDelegate {
    
    //Properties
    @IBOutlet weak var l_title: UILabel!
    @IBOutlet weak var b_help: UIButton!
    @IBOutlet weak var b_edit: UIButton!
    @IBOutlet weak var t_values: UITableView!
    @IBOutlet weak var i_icon: UIImageView!

    
    let cellIdentifier = "ValuesTableViewCell"
    
    var tableData:TableData = TableData()
    
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
    
    func setTableData(tableData: TableData) {
        self.tableData = tableData
    }
    
}

extension CategoryTableViewCell: UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.tableRepresentation.count
    }
    
    // Created the cell to put at an index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = t_values.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ValuesTableViewCell
        
        let tableRep = tableData.tableRepresentation
        
        cell.l_field.text = tableRep[indexPath.row].title
        cell.l_value.text = tableRep[indexPath.row].value
        
        cell.backgroundColor = self.t_values.backgroundColor
        
        return cell
    }
}
