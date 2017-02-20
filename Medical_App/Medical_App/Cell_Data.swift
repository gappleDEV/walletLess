//
//  Cell_Data.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/18/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

struct cellData {
    var title:String
    var image:UIImage
    var storyboardId:String
    var navButtonTitle:String
    
    init(title:String, image:UIImage, storyboardId:String, navButtonTitle:String) {
        self.title = title
        self.image = image
        self.storyboardId = storyboardId
        self.navButtonTitle = navButtonTitle
    }
}

var cells = [cellData]()
var cellHeights:[CGFloat] = []

struct subCellData {
    var text:String
    var storyboardId:String
    
    init(text:String, storyboardId:String) {
        self.text = text
        self.storyboardId = storyboardId
    }
}

var subCells = [[subCellData]]()
