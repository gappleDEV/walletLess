//
//  InsurCardPicViewController
//  Medical_App
//
//  Created by Gregory Johnson on 10/10/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit
//import RealmSwift

class InsurCardPicViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate
{
    @IBOutlet weak var im_pic: UIImageView!
    @IBOutlet weak var b_moreInfo: UIButton!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var b_takePicture: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "table.jpg")!)
        
        scroll_view.layer.cornerRadius = 20
        scroll_view.layer.borderWidth = 1.0
        scroll_view.layer.borderColor = UIColor.white.cgColor
        
        if gl_data.insuranceCardPic != nil
        {
            im_pic.contentMode = .scaleAspectFit
            im_pic.image = gl_data.insuranceCardPic
        }
        
        gl_data.helpText = "Tap the \"Take Picture\" button at the bottom to access your camera and take a picture of your insurance card. When finished you will be able to see the image you took displayed on this page"
        
        self.scroll_view.minimumZoomScale = 1.0
        self.scroll_view.maximumZoomScale = 6.0
        
        b_takePicture.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        b_takePicture.layer.borderWidth = 1.0
        b_takePicture.layer.borderColor = UIColor.white.cgColor
        
        /*let realm = try! Realm()
        
        if realm.objects(InsuranceInfo.self).count == 0
        {
            try! realm.write {
                realm.add(InsuranceInfo(), update: true)
            }
        }
        else {
            
            let insInfo = realm.objects(InsuranceInfo.self).first!
            im_pic.contentMode = .scaleAspectFit
            im_pic.image = UIImage(data: insInfo.insuranceCard as Data,scale: 1.0)
        }*/
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.im_pic
    }
    
    @IBAction func takePhoto(_ sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func toHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let myImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            im_pic.contentMode = .scaleAspectFit
            im_pic.image = myImage
            gl_data.insuranceCardPic = myImage
            
            /*let data = NSData(data: UIImageJPEGRepresentation(myImage, 1.0)!)
            
            let realm = try! Realm()
            let insuranceInfo = realm.objects(InsuranceInfo.self).first!
            try! realm.write {
                insuranceInfo.insuranceCard = data
            }*/
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showHelp(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helpPopUpID") as! HelpPopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.l_helpText.text = gl_data.helpText
        popOverVC.didMove(toParentViewController: self)
    }
}
