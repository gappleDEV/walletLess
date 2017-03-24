//
//  MessagesViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 3/23/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct messageInfo {
    var from:String = ""
    var subject:String = ""
    var body:String = ""
}

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table_messages: UITableView!
    
    var myMessages:[messageInfo] = []
    let cellIdentifier = "MessagesTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //data source and delegate of table set through storyboard
        
        Alamofire.request("http://155.246.138.85:3000/messages/receiver/" + gl_data.myUsername).responseJSON {
            response in
            //print(response)
            switch response.result {
            case .success(_):
                print("Success")
                let myJson = JSON(response.result.value!)
                let count = myJson.count
                for i in 0...count {
                    if myJson[i]["sender_id"].string != nil {
                        let from = myJson[i]["sender_id"].string!
                        let subject = myJson[i]["subject"].string!
                        let body = myJson[i]["body"].string!
                        
                        let m:messageInfo = messageInfo(from: from, subject: subject, body: body)
                        
                        self.myMessages += [m]
                    }
                }
                print(self.myMessages)
                self.table_messages.reloadData()
            case .failure(_):
                print("Request failed")
            }
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Number of cells in the section
        
        return myMessages.count
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    //height for cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //create the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell coding
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MessagesTableViewCell
        let thisCell = myMessages[(indexPath as NSIndexPath).row]
        cell.l_from.text = thisCell.from
        cell.l_subject.text = thisCell.subject
        cell.l_body.text = thisCell.body
        
        return cell
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
