//
//  ViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 4/12/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class PersonalInfoController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate
{
    //Programatically create elements****
    @IBOutlet weak var l_welcome: UILabel!
    @IBOutlet weak var b_back: UIButton!
    @IBOutlet weak var b_done: UIButton!
    @IBOutlet weak var v_topBanner: UIView!
    @IBOutlet weak var l_title: UILabel!
    
    //View Info
    var viewHeight:CGFloat!
    var viewWidth:CGFloat!
    
    //Labels
    var l_top:UILabel!
    var l_middle:UILabel!
    var l_bottom:UILabel!
    
    //Text inputs
    var i_textInputTop:UITextField!
    var i_textInputMiddle:UITextField!
    var i_textInputBottom:UITextField!
    
    //Picker
    var p_dates:UIDatePicker!
    
    var p_marStatus:UIPickerView!
    var data_marStatus = ["Single", "Married", "Divorced", "Widowed"]
    var p_sex:UIPickerView!
    var data_sex = ["Male", "Female"]
    var p_race:UIPickerView!
    var data_race = ["Caucasion", "Black", "Native American"]
    
    var p_denom:UIPickerView!
    var data_denom = ["Christianity", "Hinduism", "Islam", "Athiest"]
    var p_prefLang:UIPickerView!
    var data_prefLang = ["English", "French", "German", "Spanish", "Italian"]
    
    //Corner radius for the buttons in the view
    let cornRad:CGFloat = 50
    var topBannerAlpha:CGFloat!
    
    //Array and index for titles of each promt
    var prompt:[String] = ["Full Name", "Mother's Name", "Birthday", "Personal Info", "Personal Info", "Social Security", "Location", "Phone", "All Done!"];
    var promptIndex:Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        if realm.objects(PersonalInfo.self).count == 0
        {
            try! realm.write {
                realm.add(PersonalInfo(), update: true)
            }
        }
        
        self.viewHeight = self.view.frame.height
        self.viewWidth = self.view.frame.width
        
        self.topBannerAlpha = self.v_topBanner.alpha
        
        let screenTap = UITapGestureRecognizer()
        screenTap.addTarget(self, action: #selector(PersonalInfoController.resignNumpad))
        self.view.addGestureRecognizer(screenTap)

        fadeInGatherInfo()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Initial view with everything hidden or off screen. Allows for the starting animation
        
        self.v_topBanner.alpha = 0
        self.l_title.alpha = 0
        
        self.b_done.layer.cornerRadius = self.cornRad
        self.b_done.layer.shadowColor = UIColor.black.cgColor
        self.b_done.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.b_done.layer.shadowRadius = 3
        self.b_done.layer.shadowOpacity = 0.5
        self.b_back.alpha = 0
        self.b_done.alpha = 0
        self.b_back.isEnabled = true
    }
    
    //Number of columns in data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows in data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView
        {
        case p_marStatus:
            return data_marStatus.count
        case p_sex:
            return data_sex.count
        case p_race:
            return data_race.count
        case p_denom:
            return data_denom.count
        case p_prefLang:
            return data_prefLang.count
        default:
            return 1
        }
    }
    
    //Get value at specific point to fill each element of the picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("Select at index: \(row)")
        switch pickerView
        {
        case p_marStatus:
            return data_marStatus[row]
        case p_sex:
            return data_sex[row]
        case p_race:
            return data_race[row]
        case p_denom:
            return data_denom[row]
        case p_prefLang:
            return data_prefLang[row]
        default:
            return nil
        }
    }
    
    //Resign the number pad whenever the screen is tapped
    func resignNumpad()
    {
        self.view.endEditing(true)
    }
    
    //-----------------------------------------Beginning Animation-----------------------------------------
    
    func getBorder(_ textInput:UITextField) -> CALayer
    {
        let border = CALayer()                  //the bottom line under the input
        let bwidth = CGFloat(2.0)
        border.borderColor = UIColor(hue: 0.33, saturation: 0.52, brightness: 0.20, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: textInput.frame.size.height - bwidth, width: textInput.frame.size.width, height: 2)//textInput.frame.size.height)
        border.borderWidth = bwidth
        
        return border
    }
    
    func fillTextInputFromRealm(_ textInput:UITextField, value:String, placeholder:String, realm:Realm)
    {
        if value == ""
        {
            textInput.placeholder = placeholder
            textInput.text = ""
        }
        else {
            textInput.text = value
        }
        
    }
    
    //Step 1:
    //      Fade in "Let's gather some information"
    func fadeInGatherInfo() -> Void
    {
        UIView.animate(withDuration: 3,
                                   delay: 0,
                                   options: .curveEaseIn,
                                   animations: {
                                    self.l_welcome.alpha = 1
            },
                                   completion: { finished in
                                    print("Done")
                                    self.waitFade()
        })
    }
    
    func waitFade() -> Void
    {
        UIView.animate(withDuration: 5,
                                   delay: 0,
                                   options: .curveEaseIn,
                                   animations: {
            },
                                   completion: { finished in
                                    print("Done")
                                    self.fadeOutTitles()
        })
    }
    
    //-----------------------------------------------------------------------------------------------------
    
    //Step 4:
    //      Fadout out title and prepare next title
    func fadeOutTitles() -> Void
    {
        UIView.animate(withDuration: 0.5,
            delay: 0.25,
            options: .curveEaseIn,
            animations: {
                
                //Fade out all but the back and done buttons
                for sview in self.view.subviews as [UIView]
                {
                    if(self.promptIndex == 8)
                    {
                        sview.alpha = 0
                    }
                    else
                    {
                        if !(sview.isEqual(self.b_done)) && !(sview.isEqual(self.v_topBanner)) && !(sview.isEqual(self.b_back))
                        {
                            sview.alpha = 0
                        }
                    }
                }
                
            },
            completion: { finished in
                let realm = try! Realm()
                var personInfo = PersonalInfo()
                if realm.objects(PersonalInfo.self).count == 0
                {
                    try! realm.write {
                        realm.add(personInfo)
                    }
                }
                personInfo = realm.objects(PersonalInfo.self).first!

                self.l_title.text = self.prompt[self.promptIndex]
                let heightMultTop:CGFloat = 0.3
                let heightMultMiddle:CGFloat = 0.43
                let heightMultBottom:CGFloat = 0.56
                switch self.promptIndex
                {
                case 0: //Full Name - 3 labels and 3 text inputs
                    //Creates local variables to hold reused data (easily editable for each part)
                    let height = self.viewHeight * 0.07     //height of each text input is 8% of view height
                    let labelHeight = height * 0.3          //label height is 50% of each text input height
                    let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                    
                    let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                    
                    let labelFontSize:CGFloat = 14          //font size for the labels
                    let inputFontSize:CGFloat = 24          //font size for the text inputs
                    
                    
                    //Set up labels
                    self.l_top = UILabel(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight))
                    self.l_top.textAlignment = NSTextAlignment.left
                    self.l_top.font = UIFont.systemFont(ofSize: labelFontSize)
                    self.l_top.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                    self.l_top.text = "First Name"
                    
                    self.l_middle = UILabel(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultMiddle - labelHeight, width: width, height: labelHeight))
                    self.l_middle.textAlignment = NSTextAlignment.left
                    self.l_middle.font = UIFont.systemFont(ofSize: labelFontSize)
                    self.l_middle.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                    self.l_middle.text = "Middle Name"
                    
                    self.l_bottom = UILabel(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight))
                    self.l_bottom.textAlignment = NSTextAlignment.left
                    self.l_bottom.font = UIFont.systemFont(ofSize: labelFontSize)
                    self.l_bottom.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                    self.l_bottom.text = "Last Name"
                    
                    self.l_top.alpha = 0
                    self.l_middle.alpha = 0
                    self.l_bottom.alpha = 0
                    
                    self.view.addSubview(self.l_top)
                    self.view.addSubview(self.l_middle)
                    self.view.addSubview(self.l_bottom)
                    
                    //Set up text inputs
                    self.i_textInputTop = UITextField(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultTop, width: width, height: height))
                    self.fillTextInputFromRealm(self.i_textInputTop, value: personInfo.firstName, placeholder: "First Name", realm: realm)
                    self.i_textInputTop.textAlignment = NSTextAlignment.left
                    self.i_textInputTop.font = UIFont.systemFont(ofSize: inputFontSize)
                    self.i_textInputTop.borderStyle = UITextBorderStyle.roundedRect
                    self.i_textInputTop.autocorrectionType = UITextAutocorrectionType.no
                    self.i_textInputTop.keyboardType = UIKeyboardType.default
                    self.i_textInputTop.returnKeyType = UIReturnKeyType.done
                    self.i_textInputTop.clearButtonMode = UITextFieldViewMode.whileEditing;
                    self.i_textInputTop.contentVerticalAlignment = UIControlContentVerticalAlignment.center
                    self.i_textInputTop.delegate = self
                    self.i_textInputTop.borderStyle = UITextBorderStyle.none
                    self.i_textInputTop.layer.addSublayer(self.getBorder(self.i_textInputTop))
                    
                    self.i_textInputMiddle = UITextField(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultMiddle, width: width, height: height))
                    self.fillTextInputFromRealm(self.i_textInputMiddle, value: personInfo.middleName, placeholder: "Middle Name", realm: realm)
                    self.i_textInputMiddle.textAlignment = NSTextAlignment.left
                    self.i_textInputMiddle.font = UIFont.systemFont(ofSize: inputFontSize)
                    self.i_textInputMiddle.borderStyle = UITextBorderStyle.roundedRect
                    self.i_textInputMiddle.autocorrectionType = UITextAutocorrectionType.no
                    self.i_textInputMiddle.keyboardType = UIKeyboardType.default
                    self.i_textInputMiddle.returnKeyType = UIReturnKeyType.done
                    self.i_textInputMiddle.clearButtonMode = UITextFieldViewMode.whileEditing;
                    self.i_textInputMiddle.contentVerticalAlignment = UIControlContentVerticalAlignment.center
                    self.i_textInputMiddle.delegate = self
                    self.i_textInputMiddle.borderStyle = UITextBorderStyle.none
                    self.i_textInputMiddle.layer.addSublayer(self.getBorder(self.i_textInputMiddle))
                    
                    self.i_textInputBottom = UITextField(frame: CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultBottom, width: width, height: height))
                    self.fillTextInputFromRealm(self.i_textInputBottom, value: personInfo.lastName, placeholder: "Last Name", realm: realm)
                    self.i_textInputBottom.textAlignment = NSTextAlignment.left
                    self.i_textInputBottom.font = UIFont.systemFont(ofSize: inputFontSize)
                    self.i_textInputBottom.borderStyle = UITextBorderStyle.roundedRect
                    self.i_textInputBottom.autocorrectionType = UITextAutocorrectionType.no
                    self.i_textInputBottom.keyboardType = UIKeyboardType.default
                    self.i_textInputBottom.returnKeyType = UIReturnKeyType.done
                    self.i_textInputBottom.clearButtonMode = UITextFieldViewMode.whileEditing;
                    self.i_textInputBottom.contentVerticalAlignment = UIControlContentVerticalAlignment.center
                    self.i_textInputBottom.delegate = self
                    self.i_textInputBottom.borderStyle = UITextBorderStyle.none
                    self.i_textInputBottom.layer.addSublayer(self.getBorder(self.i_textInputBottom))
                    
                    self.i_textInputTop.alpha = 0
                    self.i_textInputMiddle.alpha = 0
                    self.i_textInputBottom.alpha = 0
                    
                    self.view.addSubview(self.i_textInputTop)
                    self.view.addSubview(self.i_textInputMiddle)
                    self.view.addSubview(self.i_textInputBottom)
                    
                    self.b_back.isEnabled = true
                    
                case 1: //Mother's Maiden Name - 3 labels and 3 text inputs
                    let height = self.viewHeight * 0.08     //height of each text input is 8% of view height
                    let labelHeight = height * 0.3          //label height is 80% of each text input height
                    let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                    
                    let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                    
                    self.l_top.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight)
                    self.l_middle.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultMiddle - labelHeight, width: width, height: labelHeight)
                    self.l_bottom.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight)
                    
                    self.l_top.text = "Mother's First Name"
                    self.fillTextInputFromRealm(self.i_textInputTop, value: personInfo.motherFirstName, placeholder: "Mother's First Name", realm: realm)
                    self.l_middle.text = "Mother's Middle Name"
                    self.fillTextInputFromRealm(self.i_textInputMiddle, value: personInfo.motherMiddleName, placeholder: "Mother's Middle Name", realm: realm)
                    self.l_bottom.text = "Mother's Maiden Last Name"
                    self.fillTextInputFromRealm(self.i_textInputBottom, value: personInfo.motherLastName, placeholder: "Mother's Maiden Last Name", realm: realm)

                    self.b_back.isEnabled = true
                    
                case 2: //Date of Birth - 1 date picker
                    let beginX = self.viewWidth * 0.5       //starts leftmost side at the center
                    let beginY = self.viewHeight * 0.5      //starts the topmost side at the center
                    let width = self.viewWidth * 0.8
                    let height = self.viewHeight * 0.5
                    
                    self.p_dates = UIDatePicker(frame: CGRect(x: beginX - 0.5 * width, y: beginY - 0.5 * height, width: width, height: height))
                    self.p_dates.datePickerMode = UIDatePickerMode.date
                    self.p_dates.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_dates.layer.cornerRadius = self.cornRad
                    if(personInfo.birthYear != 1800) //not the default date
                    {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "M/dd/yyyy"
                        let strng = "\(personInfo.birthMonth)/\(personInfo.birthDay)/\(personInfo.birthYear)"
                        print(strng)
                        let date = dateFormatter.date(from: strng)
                        self.p_dates.date = date!
                    }
                    self.p_dates.layer.masksToBounds = true
                    self.p_dates.alpha = 0
                    
                    self.view.addSubview(self.p_dates)
                    
                case 3: //Marital Status, sex, race - 3 pickers and 3 labels
                    let beginX = self.viewWidth * 0.5       //starts leftmost side at the center
                    let width = self.viewWidth * 0.8        //width of each picker
                    let height = self.viewHeight * 0.12     //height of each picker
                    let labelHeight = height * 0.5
                    let pickerMultTop:CGFloat = 0.27
                    let pickerMultMiddle:CGFloat = 0.40
                    let pickerMultBottom:CGFloat = 0.53
                    
                    self.p_marStatus = UIPickerView(frame: CGRect(x: beginX - 0.5 * width, y: self.viewHeight * pickerMultTop, width: width, height: height))
                    self.p_marStatus.dataSource = self
                    self.p_marStatus.delegate = self
                    self.p_marStatus.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_marStatus.layer.cornerRadius = self.cornRad
                    self.p_marStatus.alpha = 0
                    self.p_marStatus.selectRow(self.data_marStatus.index(of: personInfo.maritalStatus)!, inComponent: 0, animated: false)
                    
                    self.p_sex = UIPickerView(frame: CGRect(x: beginX - 0.5 * width, y: self.viewHeight * pickerMultMiddle, width: width, height: height))
                    self.p_sex.dataSource = self
                    self.p_sex.delegate = self
                    self.p_sex.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_sex.layer.cornerRadius = self.cornRad
                    self.p_sex.alpha = 0
                    
                    self.p_race = UIPickerView(frame: CGRect(x: beginX - 0.5 * width, y: self.viewHeight * pickerMultBottom, width: width, height: height))
                    self.p_race.dataSource = self
                    self.p_race.delegate = self
                    self.p_race.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_race.layer.cornerRadius = self.cornRad
                    self.p_race.alpha = 0
                    
                    self.l_top.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight)
                    self.l_middle.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultMiddle - labelHeight, width: width, height: labelHeight)
                    self.l_bottom.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight)
                    self.l_top.text = "Marital Status"
                    self.l_middle.text = "Sex"
                    self.l_bottom.text = "Race"
                    
                    self.p_sex.selectRow(self.data_sex.index(of: personInfo.sex)!, inComponent: 0, animated: false)
                    self.p_race.selectRow(self.data_race.index(of: personInfo.race)!, inComponent: 0, animated: false)
                    
                    self.view.addSubview(self.p_marStatus)
                    self.view.addSubview(self.p_sex)
                    self.view.addSubview(self.p_race)
                    
                case 4: //Denomination, Preferred Language - 2 pickers and 2 labels
                    let beginX = self.viewWidth * 0.5       //starts leftmost side at the center
                    let width = self.viewWidth * 0.8        //width of each picker
                    let height = self.viewHeight * 0.12     //height of each picker
                    let labelHeight = height * 0.5

                    self.p_denom = UIPickerView(frame: CGRect(x: beginX - 0.5 * width, y: self.viewHeight * 0.27, width: width, height: height))
                    self.p_denom.dataSource = self
                    self.p_denom.delegate = self
                    self.p_denom.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_denom.layer.cornerRadius = self.cornRad
                    self.p_denom.alpha = 0
                    
                    self.p_prefLang = UIPickerView(frame: CGRect(x: beginX - 0.5 * width, y: self.viewHeight * 0.53, width: width, height: height))
                    self.p_prefLang.dataSource = self
                    self.p_prefLang.delegate = self
                    self.p_prefLang.backgroundColor = UIColor(white: 1, alpha: 0)
                    //self.p_prefLang.layer.cornerRadius = self.cornRad
                    self.p_prefLang.alpha = 0
                    
                    self.l_top.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight)
                    self.l_bottom.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight)
                    self.l_top.text = "Denomination"
                    self.l_bottom.text = "Preferred Language"
                    
                    self.p_denom.selectRow(self.data_denom.index(of: personInfo.denomination)!, inComponent: 0, animated: false)
                    self.p_prefLang.selectRow(self.data_prefLang.index(of: personInfo.preferredLanguage)!, inComponent: 0, animated: false)
                    
                    self.view.addSubview(self.p_denom)
                    self.view.addSubview(self.p_prefLang)
                    
                case 5: //Social security number - 1 text input
                    self.i_textInputMiddle.text = ""
                    self.i_textInputMiddle.keyboardType = UIKeyboardType.numberPad
                    
                    self.fillTextInputFromRealm(self.i_textInputMiddle, value: personInfo.socialSecurity, placeholder: "Social Security Number", realm: realm)
                    
                case 6: //Address, zip and county code - 3 text inputs and 3 labels
                    let height = self.viewHeight * 0.07     //height of each text input is 8% of view height
                    let labelHeight = height * 0.3          //label height is 80% of each text input height
                    let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                    let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                    
                    self.l_top.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight)
                    self.l_middle.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultMiddle - labelHeight, width: width, height: labelHeight)
                    self.l_bottom.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight)
                    
                    self.l_top.text = "Address"
                    self.l_middle.text = "ZIP Code"
                    self.l_bottom.text = "County Code"
                    
                    self.i_textInputTop.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultTop, width: width, height: height)
                    self.i_textInputMiddle.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultMiddle, width: width, height: height)
                    self.i_textInputBottom.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultBottom, width: width, height: height)
                    
                    self.fillTextInputFromRealm(self.i_textInputTop, value: personInfo.address, placeholder: "Address", realm: realm)
                    self.fillTextInputFromRealm(self.i_textInputMiddle, value: "\(personInfo.zipCode)", placeholder: "ZIP Code", realm: realm)
                    self.fillTextInputFromRealm(self.i_textInputBottom, value: "\(personInfo.countyCode)", placeholder: "County Code", realm: realm)
                    
                case 7: //Home phone, cell phone and work phone - 3 text input and 3 labels
                    let height = self.viewHeight * 0.07     //height of each text input is 8% of view height
                    let labelHeight = height * 0.5          //label height is 80% of each text input height
                    let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                    
                    let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                    
                    self.i_textInputBottom.keyboardType = UIKeyboardType.numberPad
                    
                    self.l_top.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultTop - labelHeight, width: width, height: labelHeight)
                    self.l_middle.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultMiddle - labelHeight, width: width, height: labelHeight)
                    self.l_bottom.frame = CGRect(x: beginX - 0.5 * width, y: self.viewHeight * heightMultBottom - labelHeight, width: width, height: labelHeight)
                    
                    self.l_top.text = "Home Phone"
                    self.l_middle.text = "Cell Phone"
                    self.l_bottom.text = "Work Phone"
                    
                    self.i_textInputTop.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultTop, width: width, height: height)
                    self.i_textInputMiddle.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultMiddle, width: width, height: height)
                    self.i_textInputBottom.frame = CGRect(x: beginX - (0.5 * width), y: self.viewHeight * heightMultBottom, width: width, height: height)
                    
                    self.fillTextInputFromRealm(self.i_textInputTop, value: personInfo.homePhone, placeholder: "Home Phone Number", realm: realm)
                    self.fillTextInputFromRealm(self.i_textInputMiddle, value: personInfo.cellPhone, placeholder: "Cell Phone Number", realm: realm)
                    self.fillTextInputFromRealm(self.i_textInputBottom, value: personInfo.workPhone, placeholder: "Work Phone Number", realm: realm)
                    
                case 8: //All done
                    self.l_welcome.text = "All Done"
                    print("done")
                default:
                    print("Bad index")
                    
                }
                self.fadeInTitles()
        })
    }
    
    //Step 5:
    //      Fadein title and set location
    func fadeInTitles() -> Void
    {
        UIView.animate(withDuration: self.promptIndex == 8 ? 2 : 0.5,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                
                //When finished, top banner should not show
                if(self.promptIndex < 8)
                {
                    self.l_welcome.alpha = 0
                    self.v_topBanner.alpha = self.topBannerAlpha
                    self.l_title.alpha = 1
                }
                
                if(self.promptIndex == 0)
                {
                    
                    self.b_back.alpha = 1
                    self.b_done.alpha = 1
                }
                
                //Fade in based on index
                switch self.promptIndex
                {
                case 0: //Full Name
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    self.b_back.alpha = 1
                case 1: //Mother maiden name
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    self.b_back.alpha = 1
                case 2: //Date of birth
                    self.p_dates.alpha = 1
                case 3: //Marital Status, sex, race
                    self.l_top.alpha = 1
                    self.l_middle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.p_marStatus.alpha = 1
                    self.p_sex.alpha = 1
                    self.p_race.alpha = 1
                case 4: //Denomination, preferred language
                    self.l_top.alpha = 1
                    self.l_bottom.alpha = 1
                    self.p_denom.alpha = 1
                    self.p_prefLang.alpha = 1
                case 5: //Social Security Number
                    self.i_textInputMiddle.alpha = 1
                case 6: //Location
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    
                    self.b_done.setTitle("Next", for: UIControlState())
                case 7:
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    
                    self.b_done.setTitle("Done", for: UIControlState())
                case 8:
                    print("To move back to main view")
                    self.v_topBanner.alpha = 0
                    self.l_title.alpha = 0
                    self.l_welcome.alpha = 1
                    self.sendInfo()
                default:
                    print("Bad index")
                }
            },
            completion: { finished in
                print("Done moving and fading")
                self.b_done.isEnabled = true
                if(self.promptIndex == 8)
                {
                    print("In here")
                    
                    let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuScene") as! MenuViewController
                    self.present(nextViewController, animated:true, completion:nil)
                }
            })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func writeToRealm(myrealm:Realm, personInfo:PersonalInfo)
    {
        try! myrealm.write {
            myrealm.add(personInfo, update:true)
            print("Edited")
        }
    }
    
    //Done button is clicked
    //Add to realm and then increment promtIndex
    @IBAction func doneClicked(_ sender: AnyObject)
    {
        self.b_done.isEnabled = false
        switch promptIndex
        {
        case 0:
            //Full name (first - middle - last)
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.firstName = self.i_textInputTop!.text!
                personInfo.middleName = self.i_textInputMiddle!.text!
                personInfo.lastName = self.i_textInputBottom!.text!
            }
            print("case 0")
        case 1:
            //Mother's full maiden name (first - middle - last)
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.motherFirstName = self.i_textInputTop!.text!
                personInfo.motherMiddleName = self.i_textInputMiddle!.text!
                personInfo.motherLastName = self.i_textInputBottom!.text!
            }
            print("case 1")
        case 2:
            //Date of birth (month - day - year)
            let components = self.p_dates.calendar.dateComponents([.year, .month, .day], from: p_dates.date)
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.birthMonth = components.month!
                personInfo.birthDay = components.day!
                personInfo.birthYear = components.year!
            }
            print("case 2")
        case 3:
            //Marital status - sex - race
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.maritalStatus = self.data_marStatus[p_marStatus.selectedRow(inComponent: 0)]
                personInfo.sex = self.data_sex[p_sex.selectedRow(inComponent: 0)]
                personInfo.race = self.data_race[p_race.selectedRow(inComponent: 0)]
            }
            print("case 3")
        case 4:
            //Denomination - preferred language
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.denomination = self.data_denom[p_denom.selectedRow(inComponent: 0)]
                personInfo.preferredLanguage = self.data_prefLang[p_prefLang.selectedRow(inComponent: 0)]
            }
            print("case 4")
        case 5:
            //Social Security Number
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.socialSecurity = self.i_textInputMiddle!.text!
            }
            print("case 5")
        case 6:
            //Address - Zip Code - county code
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.address = self.i_textInputTop!.text!
                personInfo.zipCode = Int(self.i_textInputMiddle!.text!)!
                personInfo.countyCode = Int(self.i_textInputBottom!.text!)!
            }
            print("case 6")
        case 7:
            //Phone numbers (home - work - cell)
            let realm = try! Realm()
            let personInfo = realm.objects(PersonalInfo.self).first!
            try! realm.write {
                personInfo.homePhone = self.i_textInputTop!.text!
                personInfo.cellPhone = self.i_textInputMiddle!.text!
                personInfo.workPhone = self.i_textInputBottom!.text!
            }
            print("case 7")
        default:
            print("stepNum is out of bounds")
        }
        self.promptIndex += 1
        self.fadeOutTitles()
    }
    
    func sendInfo()
    {
        print("called")
        let realm = try! Realm()
        let personInfo = realm.objects(PersonalInfo.self).first!
        
        let postInfo = [
            "user_id":gl_data.myUsername,
            "first_name": personInfo.firstName,
            "last_name": personInfo.lastName,
            "middle_name": personInfo.middleName,
            //"dob": "\(personInfo.birthMonth)/\(personInfo.birthDay)/\(personInfo.birthYear)",
            "mom_first_name": personInfo.motherFirstName,
            "mom_middle_name": personInfo.motherMiddleName,
            "mom_last_name": personInfo.motherLastName,
            "marital_status": personInfo.maritalStatus,
            "sex": personInfo.sex,
            "religion": personInfo.denomination,
            "ssn": personInfo.socialSecurity,
            "address": personInfo.address,
            //"state": personInfo.state,
            //"country": personInfo.firstName,
            "zip_code": personInfo.zipCode,
            "county_code": personInfo.countyCode,
            "home_phone": personInfo.homePhone,
            "cell_phone": personInfo.cellPhone,
            "work_phone": personInfo.workPhone
        ] as [String : Any]
        Alamofire.request("http://155.246.138.85:3000/user_info", method: .post, parameters: postInfo, encoding: JSONEncoding.default).responseJSON {
            response in
            
            debugPrint(response) }
    }
    
    //Back clicked
    @IBAction func backClicked(_ sender: AnyObject)
    {
        if(self.promptIndex == 0)
        {
            let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuScene")
            self.present(nextViewController, animated:true, completion:nil)
        }
        else
        {
            self.promptIndex -= 1
            self.fadeOutTitles()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    



