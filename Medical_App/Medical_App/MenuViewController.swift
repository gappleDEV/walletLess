//
//  MenuViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/18/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit
import RealmSwift

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var b_moreInfo: UIButton!
    let cellIdentifier = "MyDataTableViewCell"
    var cellExpandHeight:CGFloat = 225
    let cellDefaultHeight:CGFloat = 80
    @IBOutlet weak var titleView: UIView!
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellExpandHeight = self.view.frame.height - titleView.frame.height
        
        //Sets up background image
        let bgView:UIView = UIView(frame: self.view.frame)
        let bgImage = UIImage(named: "images.jpg")!
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: self.view.frame.width, height: self.view.frame.height), false, 1.0)
        bgImage.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        bgView.backgroundColor = UIColor.init(patternImage: newImage!)
        let blackTint:UIView = UIView(frame: self.view.frame)
        blackTint.backgroundColor = UIColor.black
        blackTint.layer.opacity = 0.2
        bgView.addSubview(blackTint)
        
        tableView.backgroundColor = UIColor(white: 0.0, alpha: 0)
        //tableView.estimatedRowHeight = 90
        //tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 200
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(view: bgView))
        
        
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
        
        gl_data.helpText = "This menu allows you to choose which compartment of your wallet you'd like to enter. Tap a compartment's title to have it expand and see its options."
        
        self.b_moreInfo.layer.cornerRadius = self.b_moreInfo.frame.width/2
        loadData()
    }
    
    func loadData()
    {
        if(cells.count == 0)
        {
            print("Loading")
            
            let img1 = UIImage(named: "MyInfo")!
            let cell1 = cellData(title: "Personal and Employement Information", image: img1, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub1_1 = subCellData(text: "Information", storyboardId: "PersonalInfo")
            
            let img2 = UIImage(named: "Insurance")!
            let cell2 = cellData(title: "Insurance Information", image: img2, storyboardId: "InsuranceCardPic", navButtonTitle: "My Card")
            let sub2_1 = subCellData(text: "Health", storyboardId: "InsuranceCardPic")
            let sub2_2 = subCellData(text: "Motor Vehicle", storyboardId: "InsuranceCardPic")
            let sub2_3 = subCellData(text: "Home", storyboardId: "InsuranceCardPic")
            let sub2_4 = subCellData(text: "Cards", storyboardId: "InsuranceCardPic")
            let sub2_5 = subCellData(text: "Other", storyboardId: "PersonalInfo")

            
            let img3 = UIImage(named: "data")!
            let cell3 = cellData(title: "Motor Vehicle Information", image: img3, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub3_1 = subCellData(text: "License Picture", storyboardId: "InsuranceCardPic")
            let sub3_2 = subCellData(text: "Auto Insurance Picture", storyboardId: "InsuranceCardPic")
            let sub3_3 = subCellData(text: "Registration Picture", storyboardId: "InsuranceCardPic")
            
            let img4 = UIImage(named: "data")!
            let cell4 = cellData(title: "Credit/Debit Cards", image: img4, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub4_1 = subCellData(text: "Visa", storyboardId: "PersonalInfo")
            let sub4_2 = subCellData(text: "Mastercard", storyboardId: "PersonalInfo")
            let sub4_3 = subCellData(text: "American Express", storyboardId: "PersonalInfo")
            let sub4_4 = subCellData(text: "Store Credit Cards", storyboardId: "PersonalInfo")
            
            let img5 = UIImage(named: "data")!
            let cell5 = cellData(title: "Bank Information", image: img5, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub5_1 = subCellData(text: "Checking", storyboardId: "PersonalInfo")
            let sub5_2 = subCellData(text: "Savings", storyboardId: "PersonalInfo")
            let sub5_3 = subCellData(text: "Other", storyboardId: "PersonalInfo")
            
            let img6 = UIImage(named: "data")!
            let cell6 = cellData(title: "Allergies/Prescriptions", image: img6, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub6_1 = subCellData(text: "Information", storyboardId: "PersonalInfo")
            
            let img7 = UIImage(named: "data")!
            let cell7 = cellData(title: "Identification Documents/Credentials", image: img7, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub7_1 = subCellData(text: "Information", storyboardId: "PersonalInfo")
            
            let img8 = UIImage(named: "data")!
            let cell8 = cellData(title: "Store Memberships/Discount Tags", image: img8, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub8_1 = subCellData(text: "Information", storyboardId: "PersonalInfo")
            
            let img9 = UIImage(named: "data")!
            let cell9 = cellData(title: "Tickets/Vouchers", image: img9, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            let sub9_1 = subCellData(text: "Information", storyboardId: "PersonalInfo")
            
            cells += [cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9]
            
            let sub1 = [sub1_1]
            let sub2 = [sub2_1, sub2_2, sub2_3, sub2_4, sub2_5]
            let sub3 = [sub3_1, sub3_2, sub3_3]
            let sub4 = [sub4_1, sub4_2, sub4_3, sub4_4]
            let sub5 = [sub5_1, sub5_2, sub5_3]
            let sub6 = [sub6_1]
            let sub7 = [sub7_1]
            let sub8 = [sub8_1]
            let sub9 = [sub9_1]
            
            subCells += [sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9]
        }
    }
    
    //number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Number of cells in the section
        
        if(tableView.isEqual(self.tableView)) {
            return cells.count
        }
        else {
            return subCells[tableView.tag].count
        }
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    //height for cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(tableView.isEqual(self.tableView)) {
            if(selectedIndex == indexPath.row) {
                return cellExpandHeight
            } else {
                return cellDefaultHeight
            }
        }
        else {
            return 40
        }
        
    }
    
    //create the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView.isEqual(self.tableView)) {
            //cell coding
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyDataTableViewCell
            let thisCell = cells[(indexPath as NSIndexPath).row]
            cell.im_icon.image = thisCell.image
            cell.im_icon.backgroundColor = UIColor(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1)
            cell.im_icon.layer.cornerRadius = cell.im_icon.frame.width/2
            cell.l_title.text = thisCell.title
            cell.contentView.backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 0.6)
            
            cell.backgroundColor = UIColor.clear
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor(red:0, green:0, blue:0, alpha:0.5).cgColor
            
            
            // 0) Placement of table
            let tableWidth:CGFloat = tableView.frame.width * 0.8
            let tableHeight:CGFloat = tableView.frame.height * 0.7
            let x = tableView.frame.width * 0.1
            let y = (cellExpandHeight - cellDefaultHeight - tableHeight) / 2 + cellDefaultHeight
            // 1) Create UITableView
            let cellTableView = UITableView(frame: CGRect(x: x, y: y, width: tableWidth, height: tableHeight))
            cellTableView.delegate = self
            cellTableView.dataSource = self
            // 2) Set tag to allow identification between sub tables
            cellTableView.tag = indexPath.row
            // 3) Register the cell class for the table
            cellTableView.register(SubCompartmentCell.self, forCellReuseIdentifier: "subCompCell")
            // 4) Styling the table
            cellTableView.layer.cornerRadius = 15
        
            
            cell.addSubview(cellTableView)

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "subCompCell", for: indexPath) as! SubCompartmentCell
            let thisCell = subCells[tableView.tag][(indexPath as NSIndexPath).row]
            cell.textField.text = thisCell.text
            cell.textField.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40)
            
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(tableView.isEqual(self.tableView)) {
            if(selectedIndex == indexPath.row) {
                selectedIndex = -1
            } else {
                selectedIndex = indexPath.row
            }
            self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic )
            self.tableView.endUpdates()
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        } else {
            pushNext(subCells[tableView.tag][indexPath.row].storyboardId)
        }
        
    }
    @IBAction func showHelp(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helpPopUpID") as! HelpPopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func addCells(_ sender: AnyObject) {
    
        let img1 = UIImage(named: "data")!
        let newCell = cellData(title: "New Data", image: img1, storyboardId: "PersonalInfo", navButtonTitle: "Input Info")
        
        cells += [newCell]
        
        tableView.reloadData()
    }
    
    //Called when button is pressed when the table view has expanded
    func pushNext(_ storyId:String)
    {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: storyId)
        self.present(nextViewController, animated:true, completion:nil)
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
