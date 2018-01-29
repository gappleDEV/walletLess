//
//  TableData.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/13/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import RealmSwift

class TableData: Object {
    typealias MyTableData = (title: String, value: String)
    
    var tableRepresentation: [String: String] {
        return [:]
    }
}
