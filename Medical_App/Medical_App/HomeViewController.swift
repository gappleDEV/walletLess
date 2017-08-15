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
    var headerView:CategoryHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
    
    internal let cellDefaultHeight:CGFloat = 200.0
    internal var cellExpandedHeight:CGFloat!
    
    var headerExpandedMax:CGFloat = 200
    
    internal var panels: [PanelHeader] = [
        PanelHeader(icon: "MyInfo", help: "Basic personal information", title: "Personal Information", edit: "personalInfo"),
        PanelHeader(icon: "insurance", help: "Medical insurance information", title: "Insurance Information", edit: "personalInfo"),
        PanelHeader(icon: "motorVehicleInformation", help: "Car and other automotive information.", title: "Motor Vehicle Information", edit: "personalInfo"),
        PanelHeader(icon: "creditCards", help: "Card information", title: "Credit/Debit Cards", edit: "personalInfo"),
        PanelHeader(icon: "bank", help: "Banking information", title: "Bank Information", edit: "personalInfo"),
        PanelHeader(icon: "allergies", help: "Allergies and prescription information", title: "Allergies/Prescriptions", edit: "personalInfo"),
        PanelHeader(icon: "idDoc", help: "Document information", title: "Identification Documents/Credentials", edit: "personalInfo"),
        PanelHeader(icon: "discountTag", help: "Store membership information", title: "Store Memberships/Discount Tags", edit: "personalInfo"),
        PanelHeader(icon: "tickets", help: "Ticket information", title: "Tickets/Vouchers", edit: "personalInfo")
    ]
    
    internal var heights:[CGFloat] = []
    internal var subArrTypes = [User(email: "email@gmail.com", password: "pass"), User(), User(), User(), User(), User(), User(), User(), User(), User()]
    
    internal let cellIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        heights = Array(repeating: cellDefaultHeight, count: panels.count)
        
        t_categories.delegate = self
        t_categories.dataSource = self
        
        t_categories.backgroundColor = self.view.backgroundColor
        
        setUpHeader()
        setUpTableView()
        
        print("In view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Make status bar light colored
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    func setUpHeader() {
        //Sets header view to the custom view that was created
        headerView = CategoryHeaderView(frame: .zero, title: "WalletLess LLC")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: headerExpandedMax)
        headerHeightConstraint.isActive = true
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpTableView() {
        t_categories.translatesAutoresizingMaskIntoConstraints = false
        let constraints:[NSLayoutConstraint] = [
            t_categories.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            t_categories.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            t_categories.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            t_categories.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = headerExpandedMax
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func showHelp(sender:UIButton)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helpPopUpID") as! HelpPopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.l_helpText.text = panels[sender.tag].help
        popOverVC.didMove(toParentViewController: self)
    }
    
    func moveWithSegue(sender:UIButton) {
        self.performSegue(withIdentifier: panels[sender.tag].edit, sender: self)
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
        
        //Create cell
        let cell = t_categories.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryTableViewCell
        //Set properties
        cell.l_title.text = panels[indexPath.section].title
        cell.i_icon.image = UIImage(named: panels[indexPath.section].icon)
        cell.b_help.tag = indexPath.section
        cell.b_help.addTarget(self, action: #selector(showHelp), for: .touchUpInside)
        cell.b_edit.tag = indexPath.section
        cell.b_edit.addTarget(self, action: #selector(moveWithSegue), for: .touchUpInside)
        
        cell.setTableData(tableData: subArrTypes[indexPath.section])
        
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

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
            headerView.incrementTitleAlpha(offset: self.headerHeightConstraint.constant)
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            headerView.decrementTitleAlpha(offset: self.headerHeightConstraint.constant)
            if self.headerHeightConstraint.constant < 65 {
                self.headerHeightConstraint.constant = 65
            }
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > headerExpandedMax {
            animateHeader()
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > headerExpandedMax {
            animateHeader()
        }
    }
}
extension HomeViewController:UITableViewDelegate {
}
