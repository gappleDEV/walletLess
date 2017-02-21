//
//  SubCompartmentCell.swift
//  Medical_App
//
//  Created by Gregory Johnson on 2/19/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class SubCompartmentCell: UITableViewCell {

    var textField:UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Initialize Text Field
        self.textField = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width - 20, height: self.frame.height))
        print(self.frame.width)
        self.textField.textAlignment = .center
        
        //Add TextField to SubView
        self.addSubview(self.textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
