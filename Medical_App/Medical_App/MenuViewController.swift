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
            
            let img2 = UIImage(named: "Insurance")!
            let cell2 = cellData(title: "Insurance Information", image: img2, storyboardId: "InsuranceCardPic", navButtonTitle: "My Card")
            
            let img3 = UIImage(named: "data")!
            let cell3 = cellData(title: "Motor Vehicle Information", image: img3, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img4 = UIImage(named: "data")!
            let cell4 = cellData(title: "Credit/Debit Cards", image: img4, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img5 = UIImage(named: "data")!
            let cell5 = cellData(title: "Bank Information", image: img5, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img6 = UIImage(named: "data")!
            let cell6 = cellData(title: "Allergies/Prescriptions", image: img6, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img7 = UIImage(named: "data")!
            let cell7 = cellData(title: "Identification Documents/Credentials", image: img7, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img8 = UIImage(named: "data")!
            let cell8 = cellData(title: "Store Memberships/Discount Tags", image: img8, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            let img9 = UIImage(named: "data")!
            let cell9 = cellData(title: "Tickets/Vouchers", image: img9, storyboardId: "PersonalInfo", navButtonTitle: "Info")
            
            cells += [cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9]
        }
    }
    
    //number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Number of cells in the section
        return cells.count
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    //height for cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(selectedIndex == indexPath.row) {
            return cellExpandHeight
        } else {
            return cellDefaultHeight
        }
        
    }
    
    //create the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
        //Put button in the cell
        let buttonWidth:CGFloat = 64
        let buttonHeight:CGFloat = buttonWidth
        let x = cell.frame.width/2 - buttonWidth/2;
        let y = self.cellExpandHeight - 80;
        
        let buttonFrame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
        
        let newButton = UIButton(frame: buttonFrame)
        newButton.layer.backgroundColor = UIColor(red: 50/255, green: 125/255, blue: 200/255, alpha: 1).cgColor
        newButton.layer.cornerRadius = buttonWidth/2
        newButton.setTitle(thisCell.navButtonTitle, for: UIControlState())
        newButton.titleLabel!.font = UIFont(name: (newButton.titleLabel!.font?.fontName)!, size: 14)
        newButton.tag = (indexPath as NSIndexPath).section
        newButton.addTarget(self, action: #selector(MenuViewController.pushNext(_:)), for: .touchUpInside)
        cell.addSubview(newButton)
        print("Added button with title \(thisCell.navButtonTitle)")

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(selectedIndex == indexPath.row) {
            selectedIndex = -1
        } else {
            selectedIndex = indexPath.row
        }
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic )
        self.tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
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
    func pushNext(_ sender:UIButton)
    {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: cells[sender.tag].storyboardId)
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
