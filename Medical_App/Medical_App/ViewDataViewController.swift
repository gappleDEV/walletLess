//
//  ViewDataViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 1/7/18.
//  Copyright © 2018 Gregory Johnson. All rights reserved.
//

import UIKit

class ViewDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var myData = [String: String]()
    
    let headerHeight:CGFloat = 100
    let rowHeight:CGFloat = 75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = self.view.backgroundColor

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 345, height: 151))
        bgImgView.image = UIImage(named: "clipboard_top")
        bgImgView.contentMode = .scaleAspectFit
        let view = UIView()
        view.addSubview(bgImgView)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(myData.count)")
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ViewDataTableCell", owner: self, options: nil)?.first as! ViewDataTableCell
        cell.backgroundColor = self.view.backgroundColor
        
        let keys = [String](myData.keys).sorted()
        cell.l_key.text = keys[indexPath.row]
        cell.i_value.text = myData[keys[indexPath.row]]!
        
        let bgImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 345, height: 151))
        if(indexPath.row != myData.count - 1) {
            bgImgView.image = UIImage(named: "clipboard_middle")
        } else {
            bgImgView.image = UIImage(named: "clipboard_bottom")
        }
        bgImgView.contentMode = .scaleAspectFit
        cell.backgroundView = UIView()
        cell.backgroundView!.addSubview(bgImgView)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            print("data view dismissed")
        }
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
