//
//  MenuViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/18/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "MyDataTableViewCell"
    let cellExpandHeight:CGFloat = 225
    let cellDefaultHeight:CGFloat = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("--------------------------------")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        print("--------------------------------")
        
        /*let pers = PersonalInfo()

        try! realm.write {
            realm.deleteAll()
            realm.add(pers)
        }
        print("--------------------------------")
        for p in personInfo
        {
            print("->>>\(p.cellPhone)<<<-")
        }
        print("--------------------------------")*/
        
        tableView.backgroundColor = UIColor(white: 0.0, alpha: 0)        
        loadData()
    }
    
    func loadData()
    {
        if(cells.count == 0)
        {
            print("Loading")
            let img1 = UIImage(named: "data")!
            let cell1 = cellData(title: "Personal Data", image: img1, storyboardId: "PersonalInfo", navButtonTitle: "Input Info")
            
            let img2 = UIImage(named: "data")!
            let cell2 = cellData(title: "Insurance Data", image: img2, storyboardId: "InsuranceCardPic", navButtonTitle: "Take Pic")
            
            let img3 = UIImage(named: "data")!
            let cell3 = cellData(title: "Next of Kin Data", image: img3, storyboardId: "PersonalInfo", navButtonTitle: "Input Info")
            
            cells += [cell1, cell2, cell3]
            cellHeights += [cellDefaultHeight, cellDefaultHeight, cellDefaultHeight]
        }
        else
        {
            for i in 0 ..< cells.count
            {
                cellHeights[i] = cellDefaultHeight
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeights[(indexPath as NSIndexPath).section]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Number of cells in the section
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell coding
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyDataTableViewCell
        let thisCell = cells[(indexPath as NSIndexPath).section]
        cell.im_icon = UIImageView(image: thisCell.image)
        cell.l_title.text = thisCell.title
        cell.layer.cornerRadius = 30
        
        //Put button in the cell
        let x = cell.frame.width/2 - 50;
        let y = self.cellExpandHeight - 75;
        
        let buttonFrame = CGRect(x: x, y: y, width: 100, height: 50)
        
        let newButton = UIButton(frame: buttonFrame)
        newButton.setTitle(thisCell.navButtonTitle, for: UIControlState())
        newButton.titleLabel!.font = UIFont(name: (newButton.titleLabel!.font?.fontName)!, size: 20)
        newButton.tag = (indexPath as NSIndexPath).section
        newButton.addTarget(self, action: #selector(MenuViewController.pushNext(_:)), for: .touchUpInside)
        cell.addSubview(newButton)
        print("Added button with title \(thisCell.navButtonTitle)")

        return cell
    }
    
    //Called when button is pressed when the table view has expanded
    func pushNext(_ sender:UIButton)
    {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: cells[sender.tag].storyboardId)
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //When selected
        
        cellHeights[(indexPath as NSIndexPath).section] = cellHeights[(indexPath as NSIndexPath).section] == self.cellExpandHeight ? cellDefaultHeight : self.cellExpandHeight
        
        if(cellHeights[(indexPath as NSIndexPath).section] == cellExpandHeight) //is to be expanded
        {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        else //is normal
        {
            print("IndexPath: \(indexPath)")
            for b in (tableView.cellForRow(at: indexPath)!.subviews)
            {
                if b is UIButton
                {
                    b.removeFromSuperview()
                    print("Removed button with tag: \(b.tag)")
                }
            }
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        
    }
    
    @IBAction func addCells(_ sender: AnyObject) {
    
        let img1 = UIImage(named: "data")!
        let newCell = cellData(title: "New Data", image: img1, storyboardId: "PersonalInfo", navButtonTitle: "Input Info")
        
        cells += [newCell]
        cellHeights += [cellDefaultHeight]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
