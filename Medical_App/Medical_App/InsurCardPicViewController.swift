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
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func takePhoto(_ sender: AnyObject)
    {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        im_pic.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
}
