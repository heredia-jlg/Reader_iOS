//
//  ViewController.swift
//  Reader
//
//  Created by Jorge Gonzalez-Heredia on 12/25/19.
//  Copyright © 2019 Jorge Gonzalez-Heredia. All rights reserved.
//

import UIKit
import CoreGraphics

var takenPhoto = UIImage()



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    

    @IBOutlet weak var theView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
            print("Taking photo")
            
        }
        
        
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takenPhoto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true)
        
        theView.image = takenPhoto
        
        let photo = takenPhoto.cgImage
        
        _ = imageHandler(img: photo!)
        //print( bitMap.color_at(x: 500, y: 500) )
    }
    
    
    
    
}

