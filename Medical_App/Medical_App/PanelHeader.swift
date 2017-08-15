//
//  PanelHeader.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import Foundation

class PanelHeader {
    
    var icon:String="" //pic name
    var help:String="" //help message
    var title:String="" //title of panel
    var edit:String="" //segue name to edit page

    
    init(icon:String, help:String, title:String, edit:String) {
        self.icon = icon
        self.help = help
        self.title = title
        self.edit = edit
    }
    
}
