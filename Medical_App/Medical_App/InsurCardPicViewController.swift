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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        }
        dismiss(animated: true, completion: nil)
    }
    
}
