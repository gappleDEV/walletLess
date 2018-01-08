//
//  HomeViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/9/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var t_categories: UITableView!
    var headerHeightConstraint:NSLayoutConstraint!
    
    internal let cellDefaultHeight:CGFloat = 75.0
    internal var cellExpandedHeight:CGFloat!
    
    var headerExpandedMax:CGFloat = 200
    var headerExpandedMin:CGFloat = 65
    
    internal var panels: [PanelHeader] = [
        PanelHeader(icon: "MyInfo", help: "Basic personal information", title: "Personal Information", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "insurance", help: "Medical insurance information", title: "Insurance Information", edit: "InsuranceCardPic", storyboard: "InsuranceCardPic"),
        PanelHeader(icon: "motorVehicleInformation", help: "Car and other automotive information.", title: "Motor Vehicle Information", edit: "InsuranceCardPic", storyboard: "InsuranceCardPic"),
        PanelHeader(icon: "creditCards", help: "Card information", title: "Credit/Debit Cards", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "bank", help: "Banking information", title: "Bank Information", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "allergies", help: "Allergies and prescription information", title: "Allergies/Prescriptions", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "idDoc", help: "Document information", title: "Identification Documents/Credentials", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "discountTag", help: "Store membership information", title: "Store Memberships/Discount Tags", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "tickets", help: "Ticket information", title: "Tickets/Vouchers", edit: "PersonalInfo", storyboard: "PersonalInfo"),
        PanelHeader(icon: "police", help: "Documents for a police search", title: "Police Search", edit: "PersonalInfo", storyboard: "PersonalInfo")
    ]
    
    internal var subArrTypes = [PersonalInfoRepository.persRep.getUser()!, User(), User(), User(), User(), User(), User(), User(), User(), User()]
    
    internal var heights:[CGFloat] = []
    
    internal let cellIdentifier = "CategoryTableViewCell"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        heights = Array(repeating: cellDefaultHeight, count: panels.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
        
        //Make status bar light colored
        UIApplication.shared.statusBarStyle = .lightContent
        
        subArrTypes = [PersonalInfoRepository.persRep.getUser()!, User(), User(), User(), User(), User(), User(), User(), User(), User()]
        
        DispatchQueue.main.async{
            self.t_categories.reloadData()
        }
        
        
    }
    
    @objc func collapsePressed() {
        self.headerHeightConstraint.constant = headerExpandedMin
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = headerExpandedMax
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func showHelp(_ sender:UIButton)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helpPopUpID") as! HelpPopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.l_helpText.text = panels[sender.tag].help
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func moveToStoryboard(_ sender:UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: panels[sender.tag].storyboard, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: panels[sender.tag].edit)
        self.present(newViewController, animated: true, completion: nil)
        //self.performSegue(withIdentifier: "showPersonalInfo", sender: self)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return panels.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 10))
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Creates the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Cell for row at called")
        //Create cell
        let cell = UITableViewCell()
        
        return cell
    }
    
    //Height for a given cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath.section]
    }
    
    //Selecting a specific row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Get correct expanded height
        self.cellExpandedHeight = t_categories.frame.height
        print("Height to be: \(t_categories.frame.height)")
        //Begin animated updates
        self.t_categories.beginUpdates()
        //Change height of selected row
        for i in 0...(panels.count - 1) {
            if(i == indexPath.section) {
                heights[indexPath.section] = heights[indexPath.section] == cellDefaultHeight ? cellExpandedHeight : cellDefaultHeight
            } else {
                heights[i] = cellDefaultHeight
            }
        }
        //End the animated updates
        self.t_categories.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}
