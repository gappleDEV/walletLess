//
//  PersonalInfoControllerViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    var headerView:PersonalInfoHeaderView!
    @IBOutlet weak var b_next:UIButton!
    
    let headerHeight:CGFloat = 100
    var headerHeightConstraint:NSLayoutConstraint!
    
    let titles:[String] = ["Mother's Name", "My Birthday", "Basic Information", "Basic Information", "Social Security #", "Location", "Phone"]
    var pageIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.b_next.layer.cornerRadius = 50
        self.b_next.layer.shadowColor = UIColor.black.cgColor
        self.b_next.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_next.layer.shadowRadius = 3
        self.b_next.layer.shadowOpacity = 0.5
        
        setUpHeader()
        // Do any additional setup after loading the view.
    }
    
    func setUpHeader() {
        //Sets header view to the custom view that was created
        headerView = PersonalInfoHeaderView(frame: .zero, title: "Mother's Name")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: headerHeight)
        headerHeightConstraint.isActive = true
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        headerView.backButton.addTarget(self, action: #selector(decrementPageIndex), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        pageIndex = pageIndex + 1
        reloadPage()
    }
    
    func decrementPageIndex() {
        pageIndex = pageIndex - 1
        reloadPage()
    }
    
    func reloadPage() {
        if(pageIndex == -1) {
            moveToHomeView()
        } else if (pageIndex == titles.count) {
            moveToHomeView()
        } else {
            headerView.titleLabel.text = titles[pageIndex]
        }
    }
    
    func moveToHomeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
     }
    
}
