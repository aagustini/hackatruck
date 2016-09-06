//
//  FotoViewController.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/5/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit


    
class FotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var currentImage: UIImageView!
   
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this controller as the camera delegate
      //  imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Actions
   @IBAction func takePicture(sender: UIButton) {
        print("-- Tirando foto")
    
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
    
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        print("-- Foto tirada e salva em current image")
        
        if let photoTaken = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("-- Salvou foto")
            currentImage.image = photoTaken
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "savePhoto" {
            
            let savePhoto = segue.destinationViewController as! DetailsViewController
            
            if let image = currentImage.image {
                savePhoto.newImage = image
                print("-- Foto enviada")
            } else {
                print("-- Não possui imagem para enviar")
            }
        }
    }
}
