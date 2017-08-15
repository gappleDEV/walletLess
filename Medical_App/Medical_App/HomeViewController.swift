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
    let maxHeaderHeight: CGFloat = 88
    let minHeaderHeight: CGFloat = 44
    
    var previousScrollOffset:CGFloat = 0 //negative scrolling up, positive scrolling down
    
    internal var categories = ["Personal Information", "Insurance Information", "Motor Vehicle Information", "Credit/Debit Cards", "Bank Information", "Allergies/Prescriptions", "Identification Documents/Credentials", "Store Memberships/Discount Tags", "Tickets/Vouchers"]
    internal var heights:[CGFloat] = []
    internal var subArrTypes = [User(email: "email@gmail.com", password: "pass"), User(), User(), User(), User(), User(), User(), User(), User(), User()]
    
    internal let cellIdentifier = "CategoryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        heights = Array(repeating: cellDefaultHeight, count: categories.count)
        
        t_categories.delegate = self
        t_categories.dataSource = self
        
        t_categories.backgroundColor = self.view.backgroundColor
        self.cellExpandedHeight = t_categories.frame.height
        
        setUpHeader()
        setUpTableView()
        
        print("In view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Make status bar light colored
        UIApplication.shared.statusBarStyle = .lightContent
        
        //Make sure that initial height of header is expanded
        self.headerHeightConstraint.constant = self.maxHeaderHeight
    }
    
    func setUpHeader() {
        headerView = CategoryHeaderView(frame: .zero, title: "Articles")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 150)
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
            t_categories.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2),
            t_categories.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            t_categories.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            t_categories.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = 150
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
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
        cell.l_title.text = categories[indexPath.section]
        cell.setTableData(tableData: subArrTypes[indexPath.section])
        //Set visual
        cell.layer.cornerRadius = 10
        
        
        return cell
    }
    
    //Height for a given cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath.section]
    }
    
    //Selecting a specific row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Begin animated updates
        self.t_categories.beginUpdates()
        //Change height of selected row
        for i in 0...(categories.count - 1) {
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
            headerView.incrementColorAlpha(offset: self.headerHeightConstraint.constant)
            headerView.incrementArticleAlpha(offset: self.headerHeightConstraint.constant)
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            headerView.decrementColorAlpha(offset: scrollView.contentOffset.y)
            headerView.decrementArticleAlpha(offset: self.headerHeightConstraint.constant)
            if self.headerHeightConstraint.constant < 65 {
                self.headerHeightConstraint.constant = 65
            }
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
}
extension HomeViewController:UITableViewDelegate {
}
