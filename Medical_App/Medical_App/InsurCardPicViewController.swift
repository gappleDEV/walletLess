//
//  InsurCardPicViewController
//  Medical_App
//
//  Created by Gregory Johnson on 10/10/16.
//  Copyright © 2016 Gregory Johnson. All rights reserved.
//

import UIKit

class InsurCardPicViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    @IBOutlet weak var im_pic: UIImageView!
    @IBOutlet weak var b_moreInfo: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if gl_data.insuranceCardPic != nil
        {
            im_pic.contentMode = .scaleAspectFit
            im_pic.image = gl_data.insuranceCardPic
        }
        
        self.b_moreInfo.layer.borderColor = UIColor.gray.cgColor
        self.b_moreInfo.layer.borderWidth = 2
        self.b_moreInfo.layer.cornerRadius = self.b_moreInfo.frame.width/2
        
        gl_data.helpText = "Tap the \"Take Pic\" button at the bottom to access your camera and take a picture of your insurance card. When finished you will be able to see the image you took displayed on this page"
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let myImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            im_pic.contentMode = .scaleAspectFit
            im_pic.image = myImage
            gl_data.insuranceCardPic = myImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showHelp(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "helpPopUpID") as! HelpPopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
}
