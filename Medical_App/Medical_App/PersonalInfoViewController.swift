//
//  PersonalInfoControllerViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 8/15/17.
//  Copyright © 2017 Gregory Johnson. All rights reserved.
//


/*****************************************
 *
 * FILE TO BE DELETED
 *
 *****************************************/

import UIKit

class PersonalInfoViewController: UIViewController {
    
    var bodyView:UIStackView!
    @IBOutlet weak var b_next:UIButton!
    
    let headerHeight:CGFloat = 90
    let bodyHeight:CGFloat = 300
    var headerHeightConstraint:NSLayoutConstraint!
    
    var bDisAlpha:CGFloat = 0.8
    
    let titles:[String] = ["Mother's Name", "My Birthday", "Basic Information", "Basic Information", "Social Security #", "Location", "Phone"]
    var pageIndex:Int = 0
    
    var data_marStatus = ["","Single", "Married", "Divorced", "Widowed"]
    var data_sex = ["","Male", "Female"]
    var data_race = ["","Caucasion", "Black", "Native American"]
    
    var marStatus:String = ""
    var sex:String = ""
    var race:String = ""
    
    var data_denom = ["", "Christianity", "Hinduism", "Islam", "Athiest"]
    var data_prefLang = ["", "English", "French", "German", "Spanish", "Italian"]
    
    var denom:String = ""
    var prefLang:String = ""
    
    var personalInfo:PersonalInfo = PersonalInfoRepository.persRep.getUser()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    //Called when screen is tapped
    @objc func resignKeyboard(){
        self.view.endEditing(true)
    }
    
    func fadeInBody(_ completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bodyView.alpha = 1
        }, completion: {
            finished in
            print("Did finish fade in: \(finished)")
            self.b_next.isEnabled = true
            self.b_next.alpha = 1
            completion(finished)
        })
    }
    
    func fadeOutBody(_ completion: @escaping (Bool) -> ()) {
        b_next.isEnabled = false
        b_next.alpha = bDisAlpha
        UIView.animate(withDuration: 0.5, animations: {
            self.bodyView.alpha = 0
        }, completion: {
            finished in
            print("Did finish fade out: \(finished)")
            //Remove all subviews in body
            for v in self.bodyView.arrangedSubviews {
                self.bodyView.removeArrangedSubview(v)
                v.removeFromSuperview()
            }
            completion(finished)
        })
    }
    
    
    
    @IBAction func nextPressed(_ sender: Any) {
        let user = PersonalInfoRepository.persRep.getUser()
        switch pageIndex {
        case 0: //mother
            let values = getValuesFromTextInput()
            let _ = PersonalInfoRepository.persRep.updateMotherInfo(user!, first: values[0], middle: values[1], last: values[2])
        case 1: //DOB
            let components = getDatePicker().calendar.dateComponents([.year, .month, .day], from: getDatePicker().date)
            let _ = PersonalInfoRepository.persRep.updateDOBInfo(user!, month: components.month!, day: components.day!, year: components.year!)
        case 2: //marry, sex, race
            let _ = PersonalInfoRepository.persRep.updateBasicInfoOne(user!, maritalStatus: marStatus, sex: sex, race: race)
        case 3: //denomination, preferred language
            let _ = PersonalInfoRepository.persRep.updateBasicInfoTwo(user!, denomination: denom, preferredLanguage: prefLang)
        case 4: //social security
            let values = getValuesFromTextInput()
            let _ = PersonalInfoRepository.persRep.updateSocialSecurity(user!, socialSecurity: values[0])
        case 5: //address, zip code, county code
            let values = getValuesFromTextInput()
            let _ = PersonalInfoRepository.persRep.updateLocation(user!, address: values[0], zipCode: values[1], countyCode: values[2])
        case 6: //home, cell, work phones
            let values = getValuesFromTextInput()
            let _ = PersonalInfoRepository.persRep.updatePhone(user!, home: values[0], cell: values[1], work: values[2])
        default:
            print("Saving for \(pageIndex) not implemented yet")
        }
        pageIndex = pageIndex + 1
    }
    
    func getValuesFromTextInput() -> [String] {
        var toRet:[String] = []
        for e in bodyView.arrangedSubviews {
            if e is UIStackView {
                for l in (e as! UIStackView).arrangedSubviews {
                    if l is UITextField {
                        toRet.append((l as! UITextField).text!)
                    }
                }
            }
        }
        return toRet
    }
    
    func getDatePicker() -> UIDatePicker {
        var toRet:UIDatePicker = UIDatePicker()
        for e in bodyView.arrangedSubviews {
            if e is UIDatePicker {
                toRet = (e as! UIDatePicker)
                break
            }
        }
        return toRet
    }
    
    @objc func decrementPageIndex() {
        pageIndex = pageIndex - 1
    }
    
    @objc func moveToHomeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PersonalInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should Edit")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return false
    }
}

extension PersonalInfoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Number of columns in data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag
        {
        case 0:
            return data_marStatus.count
        case 1:
            return data_sex.count
        case 2:
            return data_race.count
        case 3:
            return data_denom.count
        case 4:
            return data_prefLang.count
        default:
            return 1
        }
    }
    
    //Get value at specific point to fill each element of the picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag
        {
        case 0:
            return data_marStatus[row]
        case 1:
            return data_sex[row]
        case 2:
            return data_race[row]
        case 3:
            return data_denom[row]
        case 4:
            return data_prefLang[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: //marital status
            marStatus = data_marStatus[row]
        case 1: //sex
            sex = data_sex[row]
        case 2: //race
            race = data_race[row]
        case 3: //denomination
            denom = data_denom[row]
        case 4: //preferrred language
            prefLang = data_prefLang[row]
        default:
            print("picker value set for \(pickerView.tag) not implemented")
        }
    }
}
