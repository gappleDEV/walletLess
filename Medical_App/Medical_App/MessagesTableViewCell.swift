//
//  MessagesTableViewCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 3/23/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var l_from: UILabel!
    @IBOutlet weak var l_subject: UILabel!
    @IBOutlet weak var l_body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

