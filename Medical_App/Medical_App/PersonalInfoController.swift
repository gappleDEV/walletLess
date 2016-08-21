//
//  ViewController.swift
//  Medical_App
//
//  Created by Gregory Johnson on 4/12/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit
import Alamofire

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
    var marStatusVal:String!
    var p_sex:UIPickerView!
    var data_sex = ["Male", "Female"]
    var sexVal:String!
    var p_race:UIPickerView!
    var data_race = ["Caucasion", "Black", "Native American"]
    var raceVal:String!
    
    var p_denom:UIPickerView!
    var data_denom = ["Christianity", "Hinduism", "Islam", "Athiest"]
    var denomVal:String!
    var p_prefLang:UIPickerView!
    var data_prefLang = ["English", "French", "German", "Spanish", "Italian"]
    var prefLangVal:String!
    
    //Keys for the plist
    let FirstNameKey = "First_Name"
    let MiddleNameKey = "Middle_Name"
    let LastNameKey = "Last_Name"
    
    let MotherFirstNameKey = "Mother_First_Name"
    let MotherMiddleNameKey = "Mother_Middle_Name"
    let MotherLastNameKey = "Mother_Last_Name"
    
    let BirthYearKey = "Birth_Year"
    let BirthMonthKey = "Birth_Month"
    let BirthDayKey = "Birth_Day"
    
    let MarStatusKey = "Marital_Status"
    let SexKey = "Sex"
    let RaceKey = "Race"
    
    let DenomKey = "Denomination"
    let PrefLangKey = "Preferred_Language"
    
    let SocialSecNumKey = "Social_Security_Number"
    
    let AddrKey = "Address"
    let ZipKey = "ZIP_Code"
    let CountKey = "County_Code"
    
    let HomePhoneKey = "Home_Phone_Number"
    let WorkPhoneKey = "Work_Phone_Number"
    let CellPhoneKey = "Cell_Phone_Number"
    
    //Corner radius for the buttons in the view
    let cornRad:CGFloat = 50
    
    //Array and index for titles of each promt
    var prompt:[String] = ["Full Name", "Mother's Name", "Birthday", "Personal Info", "Personal Info", "Social Security", "Location", "Phone", "All Done!"];
    var promptIndex:Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewHeight = self.view.frame.height
        self.viewWidth = self.view.frame.width
        
        let screenTap = UITapGestureRecognizer()
        screenTap.addTarget(self, action: #selector(PersonalInfoController.resignNumpad))
        self.view.addGestureRecognizer(screenTap)

        fadeInGatherInfo()
        
       /* To change and retrieve plist info
        //1
        if let plist = Plist(name: "User_Info") {
            //2
            let dict = plist.getMutablePlistFile()!
            dict[NameKey] = "Gregory"
            //3
            do {
                try plist.addValuesToPlistFile(dict)
            } catch {
                print(error)
            }
            //4
            print(plist.getValuesInPlistFile())
        } else {
            print("Unable to get Plist")
        }
         */
    }
    
    override func viewWillAppear(animated: Bool)
    {
        //Initial view with everything hidden or off screen. Allows for the starting animation
        self.l_title.alpha = 0
        
        self.b_done.layer.cornerRadius = self.cornRad
        self.b_done.layer.shadowColor = UIColor.blackColor().CGColor
        self.b_done.layer.shadowOffset = CGSizeMake(0, 5)
        self.b_done.layer.shadowRadius = 3
        self.b_done.layer.shadowOpacity = 0.5
        self.b_back.alpha = 0
        self.b_done.alpha = 0
        self.b_back.enabled = false
    }
    
    //Number of columns in data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows in data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
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
    
    //Get value at specific point
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView
        {
        case p_marStatus:
            marStatusVal = data_marStatus[row]
            return marStatusVal
        case p_sex:
            sexVal = data_sex[row]
            return sexVal
        case p_race:
            raceVal = data_race[row]
            return raceVal
        case p_denom:
            denomVal = data_denom[row]
            return denomVal
        case p_prefLang:
            prefLangVal = data_prefLang[row]
            return prefLangVal
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
    
    func getBorder(textInput:UITextField) -> CALayer
    {
        let border = CALayer()                  //the bottom line under the input
        let bwidth = CGFloat(2.0)
        border.borderColor = UIColor(hue: 0.33, saturation: 0.52, brightness: 0.20, alpha: 1).CGColor
        border.borderWidth = bwidth
        
        border.frame = CGRectMake(0, textInput.frame.size.height - bwidth, textInput.frame.size.width, textInput.frame.size.height)
        
        return border
    }
    
    func fillTextInput(textInput:UITextField, key:String, placeholder:String)
    {
        if(g_plist!.getMutablePlistFile()![key] as? String == "") {
            textInput.placeholder = placeholder
            textInput.text = ""
        }
        else {
            textInput.text = g_plist!.getMutablePlistFile()![key] as? String
        }
    }
    
    //Step 1:
    //      Fade in "Let's gather some information"
    func fadeInGatherInfo() -> Void
    {
        UIView.animateWithDuration(3,
                                   delay: 0,
                                   options: .CurveEaseIn,
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
        UIView.animateWithDuration(5,
                                   delay: 0,
                                   options: .CurveEaseIn,
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
        UIView.animateWithDuration(0.5,
            delay: 0.25,
            options: .CurveEaseIn,
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
                if(g_plist != nil)
                {
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
                        self.l_top = UILabel(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultTop - labelHeight, width, labelHeight))
                        self.l_top.textAlignment = NSTextAlignment.Left
                        self.l_top.font = UIFont.systemFontOfSize(labelFontSize)
                        self.l_top.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                        self.l_top.text = "First Name"
                        
                        self.l_middle = UILabel(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultMiddle - labelHeight, width, labelHeight))
                        self.l_middle.textAlignment = NSTextAlignment.Left
                        self.l_middle.font = UIFont.systemFontOfSize(labelFontSize)
                        self.l_middle.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                        self.l_middle.text = "Middle Name"
                        
                        self.l_bottom = UILabel(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultBottom - labelHeight, width, labelHeight))
                        self.l_bottom.textAlignment = NSTextAlignment.Left
                        self.l_bottom.font = UIFont.systemFontOfSize(labelFontSize)
                        self.l_bottom.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
                        self.l_bottom.text = "Last Name"
                        
                        self.l_top.alpha = 0
                        self.l_middle.alpha = 0
                        self.l_bottom.alpha = 0
                        
                        self.view.addSubview(self.l_top)
                        self.view.addSubview(self.l_middle)
                        self.view.addSubview(self.l_bottom)
                        
                        //Set up text inputs
                        self.i_textInputTop = UITextField(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultTop, width, height))
                        self.fillTextInput(self.i_textInputTop, key: self.FirstNameKey, placeholder: "First Name")
                        self.i_textInputTop.textAlignment = NSTextAlignment.Left
                        self.i_textInputTop.font = UIFont.systemFontOfSize(inputFontSize)
                        self.i_textInputTop.borderStyle = UITextBorderStyle.RoundedRect
                        self.i_textInputTop.autocorrectionType = UITextAutocorrectionType.No
                        self.i_textInputTop.keyboardType = UIKeyboardType.Default
                        self.i_textInputTop.returnKeyType = UIReturnKeyType.Done
                        self.i_textInputTop.clearButtonMode = UITextFieldViewMode.WhileEditing;
                        self.i_textInputTop.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
                        self.i_textInputTop.delegate = self
                        self.i_textInputTop.borderStyle = UITextBorderStyle.None
                        self.i_textInputTop.layer.addSublayer(self.getBorder(self.i_textInputTop))
                        
                        self.i_textInputMiddle = UITextField(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultMiddle, width, height))
                        self.fillTextInput(self.i_textInputMiddle, key: self.MiddleNameKey, placeholder: "Middle Name")
                        self.i_textInputMiddle.textAlignment = NSTextAlignment.Left
                        self.i_textInputMiddle.font = UIFont.systemFontOfSize(inputFontSize)
                        self.i_textInputMiddle.borderStyle = UITextBorderStyle.RoundedRect
                        self.i_textInputMiddle.autocorrectionType = UITextAutocorrectionType.No
                        self.i_textInputMiddle.keyboardType = UIKeyboardType.Default
                        self.i_textInputMiddle.returnKeyType = UIReturnKeyType.Done
                        self.i_textInputMiddle.clearButtonMode = UITextFieldViewMode.WhileEditing;
                        self.i_textInputMiddle.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
                        self.i_textInputMiddle.delegate = self
                        self.i_textInputMiddle.borderStyle = UITextBorderStyle.None
                        self.i_textInputMiddle.layer.addSublayer(self.getBorder(self.i_textInputMiddle))
                        
                        self.i_textInputBottom = UITextField(frame: CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultBottom, width, height))
                        self.fillTextInput(self.i_textInputBottom, key: self.LastNameKey, placeholder: "Last Name")
                        self.i_textInputBottom.textAlignment = NSTextAlignment.Left
                        self.i_textInputBottom.font = UIFont.systemFontOfSize(inputFontSize)
                        self.i_textInputBottom.borderStyle = UITextBorderStyle.RoundedRect
                        self.i_textInputBottom.autocorrectionType = UITextAutocorrectionType.No
                        self.i_textInputBottom.keyboardType = UIKeyboardType.Default
                        self.i_textInputBottom.returnKeyType = UIReturnKeyType.Done
                        self.i_textInputBottom.clearButtonMode = UITextFieldViewMode.WhileEditing;
                        self.i_textInputBottom.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
                        self.i_textInputBottom.delegate = self
                        self.i_textInputBottom.borderStyle = UITextBorderStyle.None
                        self.i_textInputBottom.layer.addSublayer(self.getBorder(self.i_textInputBottom))
                        
                        self.i_textInputTop.alpha = 0
                        self.i_textInputMiddle.alpha = 0
                        self.i_textInputBottom.alpha = 0
                        
                        self.view.addSubview(self.i_textInputTop)
                        self.view.addSubview(self.i_textInputMiddle)
                        self.view.addSubview(self.i_textInputBottom)
                        
                        self.b_back.enabled = false
                        
                    case 1: //Mother's Maiden Name - 3 labels and 3 text inputs
                        let height = self.viewHeight * 0.08     //height of each text input is 8% of view height
                        let labelHeight = height * 0.3          //label height is 80% of each text input height
                        let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                        
                        let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                        
                        self.l_top.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultTop - labelHeight, width, labelHeight)
                        self.l_middle.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultMiddle - labelHeight, width, labelHeight)
                        self.l_bottom.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultBottom - labelHeight, width, labelHeight)
                        
                        self.l_top.text = "Mother's First Name"
                        self.fillTextInput(self.i_textInputTop, key: self.MotherFirstNameKey, placeholder: "Mother's First Name")
                        self.l_middle.text = "Mother's Middle Name"
                        self.fillTextInput(self.i_textInputMiddle, key: self.MotherMiddleNameKey, placeholder: "Mother's Middle Name")
                        self.l_bottom.text = "Mother's Maiden Last Name"
                        self.fillTextInput(self.i_textInputBottom, key: self.MotherLastNameKey, placeholder: "Mother's Maiden Last Name")

                        self.b_back.enabled = true
                        
                    case 2: //Date of Birth - 1 date picker
                        let beginX = self.viewWidth * 0.5       //starts leftmost side at the center
                        let beginY = self.viewHeight * 0.5      //starts the topmost side at the center
                        let width = self.viewWidth * 0.8
                        let height = self.viewHeight * 0.5
                        
                        self.p_dates = UIDatePicker(frame: CGRectMake(beginX - 0.5 * width, beginY - 0.5 * height, width, height))
                        self.p_dates.datePickerMode = UIDatePickerMode.Date
                        self.p_dates.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_dates.layer.cornerRadius = self.cornRad
                        if((g_plist!.getMutablePlistFile()![self.BirthYearKey] as? Int) != 1900)
                        {
                            let dateFormatter = NSDateFormatter()
                            dateFormatter.dateFormat = "M/dd/yyyy"
                            let strng = "\(g_plist!.getMutablePlistFile()![self.BirthMonthKey] as! Int)/\(g_plist!.getMutablePlistFile()![self.BirthDayKey] as! Int)/\(g_plist!.getMutablePlistFile()![self.BirthYearKey] as! Int)"
                            print(strng)
                            let date = dateFormatter.dateFromString(strng)
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
                        let pickerMultTop:CGFloat = 0.25
                        let pickerMultMiddle:CGFloat = 0.38
                        let pickerMultBottom:CGFloat = 0.51
                        
                        self.p_marStatus = UIPickerView(frame: CGRectMake(beginX - 0.5 * width, self.viewHeight * pickerMultTop, width, height))
                        self.p_marStatus.dataSource = self
                        self.p_marStatus.delegate = self
                        self.p_marStatus.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_marStatus.layer.cornerRadius = self.cornRad
                        self.p_marStatus.alpha = 0
                        
                        self.p_sex = UIPickerView(frame: CGRectMake(beginX - 0.5 * width, self.viewHeight * pickerMultMiddle, width, height))
                        self.p_sex.dataSource = self
                        self.p_sex.delegate = self
                        self.p_sex.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_sex.layer.cornerRadius = self.cornRad
                        self.p_sex.alpha = 0
                        
                        self.p_race = UIPickerView(frame: CGRectMake(beginX - 0.5 * width, self.viewHeight * pickerMultBottom, width, height))
                        self.p_race.dataSource = self
                        self.p_race.delegate = self
                        self.p_race.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_race.layer.cornerRadius = self.cornRad
                        self.p_race.alpha = 0
                        
                        self.l_top.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultTop - labelHeight, width, labelHeight)
                        self.l_middle.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultMiddle - labelHeight, width, labelHeight)
                        self.l_bottom.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultBottom - labelHeight, width, labelHeight)
                        self.l_top.text = "Marital Status"
                        self.l_middle.text = "Sex"
                        self.l_bottom.text = "Race"
                        
                        self.view.addSubview(self.p_marStatus)
                        self.view.addSubview(self.p_sex)
                        self.view.addSubview(self.p_race)
                        
                    case 4: //Denomination, Preferred Language - 2 pickers and 2 labels
                        let beginX = self.viewWidth * 0.5       //starts leftmost side at the center
                        let width = self.viewWidth * 0.8        //width of each picker
                        let height = self.viewHeight * 0.12     //height of each picker
                        let labelHeight = height * 0.5

                        self.p_denom = UIPickerView(frame: CGRectMake(beginX - 0.5 * width, self.viewHeight * 0.25, width, height))
                        self.p_denom.dataSource = self
                        self.p_denom.delegate = self
                        self.p_denom.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_denom.layer.cornerRadius = self.cornRad
                        self.p_denom.alpha = 0
                        
                        self.p_prefLang = UIPickerView(frame: CGRectMake(beginX - 0.5 * width, self.viewHeight * 0.51, width, height))
                        self.p_prefLang.dataSource = self
                        self.p_prefLang.delegate = self
                        self.p_prefLang.backgroundColor = UIColor(white: 1, alpha: 0)
                        //self.p_prefLang.layer.cornerRadius = self.cornRad
                        self.p_prefLang.alpha = 0
                        
                        self.l_top.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultTop - labelHeight, width, labelHeight)
                        self.l_bottom.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultBottom - labelHeight, width, labelHeight)
                        self.l_top.text = "Denomination"
                        self.l_bottom.text = "Preferred Language"
                        
                        self.view.addSubview(self.p_denom)
                        self.view.addSubview(self.p_prefLang)
                        
                    case 5: //Social security number - 1 text input
                        self.i_textInputMiddle.text = ""
                        self.i_textInputMiddle.keyboardType = UIKeyboardType.NumberPad
                        self.fillTextInput(self.i_textInputMiddle, key: self.SocialSecNumKey, placeholder: "Social Security Number")
                        
                    case 6: //Address, zip and county code - 3 text inputs and 3 labels
                        let height = self.viewHeight * 0.07     //height of each text input is 8% of view height
                        let labelHeight = height * 0.3          //label height is 80% of each text input height
                        let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                        let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                        
                        self.l_top.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultTop - labelHeight, width, labelHeight)
                        self.l_middle.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultMiddle - labelHeight, width, labelHeight)
                        self.l_bottom.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultBottom - labelHeight, width, labelHeight)
                        
                        self.l_top.text = "Address"
                        self.l_middle.text = "ZIP Code"
                        self.l_bottom.text = "County Code"
                        
                        self.i_textInputTop.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultTop, width, height)
                        self.i_textInputMiddle.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultMiddle, width, height)
                        self.i_textInputBottom.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultBottom, width, height)
                        
                        self.fillTextInput(self.i_textInputTop, key: self.AddrKey, placeholder: "Address")
                        self.fillTextInput(self.i_textInputMiddle, key: self.ZipKey, placeholder: "ZIP Code")
                        self.fillTextInput(self.i_textInputBottom, key: self.CountKey, placeholder: "County Code")
                        
                    case 7: //Home phone, cell phone and work phone - 3 text input and 3 labels
                        let height = self.viewHeight * 0.07     //height of each text input is 8% of view height
                        let labelHeight = height * 0.5          //label height is 80% of each text input height
                        let width = self.viewWidth * 0.8        //width of each text input is 80% of the view width
                        
                        let beginX = self.viewWidth * 0.5       //starts each subview's leftmost side at the center
                        
                        self.l_top.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultTop - labelHeight, width, labelHeight)
                        self.l_middle.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultMiddle - labelHeight, width, labelHeight)
                        self.l_bottom.frame = CGRectMake(beginX - 0.5 * width, self.viewHeight * heightMultBottom - labelHeight, width, labelHeight)
                        
                        self.l_top.text = "Home Phone"
                        self.l_middle.text = "Cell Phone"
                        self.l_bottom.text = "Work Phone"
                        
                        self.i_textInputTop.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultTop, width, height)
                        self.i_textInputMiddle.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultMiddle, width, height)
                        self.i_textInputBottom.frame = CGRectMake(beginX - (0.5 * width), self.viewHeight * heightMultBottom, width, height)
                        
                        self.fillTextInput(self.i_textInputTop, key: self.HomePhoneKey, placeholder: "Home Phone Number")
                        self.fillTextInput(self.i_textInputMiddle, key: self.CellPhoneKey, placeholder: "Cell Phone Number")
                        self.fillTextInput(self.i_textInputBottom, key: self.WorkPhoneKey, placeholder: "Work Phone Number")
                        
                    case 8: //All done
                        self.l_welcome.text = "All Done"
                        print("done")
                    default:
                        print("Bad index")
                        
                    }
                    self.fadeInTitles()
                }
            })
    }
    
    //Step 5:
    //      Fadein title and set location
    func fadeInTitles() -> Void
    {
        UIView.animateWithDuration(self.promptIndex == 8 ? 2 : 0.5,
            delay: 0.0,
            options: .CurveEaseIn,
            animations: {
                
                self.l_welcome.alpha = 0
                self.l_title.alpha = 1
                
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
                    self.b_back.alpha = 0.5
                case 1: //Mother maiden name
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    self.b_back.alpha = 1.0
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
                    
                    self.b_done.setTitle("Next", forState: UIControlState.Normal)
                case 7:
                    self.l_top.alpha = 1
                    self.i_textInputTop.alpha = 1
                    self.l_middle.alpha = 1
                    self.i_textInputMiddle.alpha = 1
                    self.l_bottom.alpha = 1
                    self.i_textInputBottom.alpha = 1
                    
                    self.b_done.setTitle("Done", forState: UIControlState.Normal)
                case 8:
                    print("To move back to main view")
                    self.l_welcome.alpha = 1
                    self.sendInfo()
                default:
                    print("Bad index")
                }
            },
            completion: { finished in
                print(g_plist!.getValuesInPlistFile())
                print("Done moving and fading")
                self.b_done.enabled = true
                if(self.promptIndex == 8)
                {
                    print("In here")
                    
                    let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MenuScene") as! MenuViewController
                    self.presentViewController(nextViewController, animated:true, completion:nil)
                }
            })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Done button is clicked
    //Add to plist and then increment promtIndex
    @IBAction func doneClicked(sender: AnyObject)
    {
        self.b_done.enabled = false
         if(g_plist != nil)
         {
            let dict = g_plist!.getMutablePlistFile()!
            switch promptIndex
            {
            case 0:
                //Full name (first - middle - last)
                dict[FirstNameKey] = self.i_textInputTop!.text
                dict[MiddleNameKey] = self.i_textInputMiddle!.text
                dict[LastNameKey] = self.i_textInputBottom!.text
                print("case 0")
            case 1:
                //Mother's full maiden name (first - middle - last)
                dict[MotherFirstNameKey] = self.i_textInputTop!.text
                dict[MotherMiddleNameKey] = self.i_textInputMiddle!.text
                dict[MotherLastNameKey] = self.i_textInputBottom!.text
                print("case 1")
            case 2:
                //Date of birth (month - day - year)
                let components = self.p_dates.calendar.components([.Year, .Month, .Day], fromDate: p_dates.date)
                dict[BirthMonthKey] = components.month
                dict[BirthDayKey] = components.day
                dict[BirthYearKey] = components.year
                print("case 2")
            case 3:
                //Marital status - sex - race
                dict[MarStatusKey] = marStatusVal
                dict[SexKey] = sexVal
                dict[RaceKey] = raceVal
                print("case 3")
            case 4:
                //Denomination - preferred language
                dict[DenomKey] = denomVal
                dict[PrefLangKey] = prefLangVal
                print("case 4")
            case 5:
                //Social Security Number
                dict[SocialSecNumKey] = self.i_textInputMiddle!.text
                print("case 5")
            case 6:
                //Address - country code
                dict[AddrKey] = self.i_textInputTop!.text
                dict[ZipKey] = self.i_textInputMiddle!.text
                dict[CountKey] = self.i_textInputBottom!.text
                print("case 6")
            case 7:
                //Phone numbers (home - work - cell)
                dict[HomePhoneKey] = self.i_textInputTop!.text
                dict[CellPhoneKey] = self.i_textInputMiddle!.text
                dict[WorkPhoneKey] = self.i_textInputBottom!.text
                print("case 7")
            default:
                print("stepNum is out of bounds")
        }
         do
         {
            try g_plist?.addValuesToPlistFile(dict)
         }
         catch
         {
            print(error)
         }
            print(g_plist!.getValuesInPlistFile())
         }
        
        self.promptIndex += 1
        self.fadeOutTitles()
    }
    
    func sendInfo()
    {
        print("called")
        if(g_plist != nil)
        {
            let dict = g_plist!.getMutablePlistFile()!
            let ipAddr = "http://155.246.138.11:1380/data"
            var parameters = [
                FirstNameKey: dict[FirstNameKey]!,
                MiddleNameKey: dict[MiddleNameKey]!,
                LastNameKey: dict[LastNameKey]!]
            Alamofire.request(.POST, ipAddr, parameters: parameters)
            parameters = [
                MotherFirstNameKey: dict[MotherFirstNameKey]!,
                MotherMiddleNameKey: dict[MotherMiddleNameKey]!,
                MotherLastNameKey: dict[MotherLastNameKey]!]
                parameters = [
                BirthYearKey: dict[BirthYearKey]!,
                BirthMonthKey: dict[BirthMonthKey]!,
                BirthDayKey: dict[BirthDayKey]!]
            Alamofire.request(.POST, ipAddr, parameters: parameters)
            parameters = [
                MarStatusKey: dict[MarStatusKey]!,
                SexKey: dict[SexKey]!,
                RaceKey: dict[RaceKey]!,
                DenomKey: dict[DenomKey]!,
                PrefLangKey: dict[PrefLangKey]!,
                SocialSecNumKey: dict[SocialSecNumKey]!]
            Alamofire.request(.POST, ipAddr, parameters: parameters)
            parameters = [
                AddrKey: dict[AddrKey]!,
                ZipKey: dict[ZipKey]!,
                CountKey: dict[CountKey]!,
                HomePhoneKey: dict[HomePhoneKey]!,
                WorkPhoneKey: dict[WorkPhoneKey]!,
                CellPhoneKey: dict[CellPhoneKey]!]
            Alamofire.request(.POST, ipAddr, parameters: parameters)
        }
        /*Alamofire.request(.GET, "https://155.264.138.11/data", parameters: ["name": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }*/
    }
    
    //Back clicked
    @IBAction func backClicked(sender: AnyObject)
    {
        self.promptIndex -= 1
        self.fadeOutTitles()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    



