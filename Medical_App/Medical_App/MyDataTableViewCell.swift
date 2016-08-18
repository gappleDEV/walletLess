//
//  MyDataTableViewCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/18/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

class MyDataTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var l_title: UILabel!
    @IBOutlet weak var im_icon: UIImageView!
    @IBOutlet weak var v_buttonPos: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
