//
//  ValuesTableViewCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class ValuesTableViewCell: UITableViewCell {
    
    //Properties
    @IBOutlet weak var l_field: UILabel!
    @IBOutlet weak var l_value: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
