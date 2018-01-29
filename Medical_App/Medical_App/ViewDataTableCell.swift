//
//  ViewDataTableCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 1/29/18.
//  Copyright © 2018 Gregory Johnson. All rights reserved.
//

import UIKit

class ViewDataTableCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var l_key: UILabel!
    @IBOutlet weak var i_value: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        i_value.delegate = self
        i_value.layer.borderWidth = 1.5
        
        i_value.layer.borderColor = commonData.unselectedBorder.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = commonData.selectedBorder.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = commonData.unselectedBorder.cgColor
        
        //save new values
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
