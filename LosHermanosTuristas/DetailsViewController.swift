//
//  DetailsViewController.swift
//  LosHermanosTuristas
//
//  Created by Student on 05/09/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var takenImage: UIImageView!

    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var descricao: UITextField!
    @IBOutlet weak var tags: UITableView!
    
    //var newPhoto: Photo = Photo()
    var newImage: UIImage!
    
    var locMan: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locMan.desiredAccuracy = kCLLocationAccuracyBest
        locMan.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
        takenImage.image = newImage
        
        print("-- DetailsViewController carregada")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddObject(sender: AnyObject) {

        let newPhoto: MockPhoto = MockPhoto()
        newPhoto.descr = descricao.text
        newPhoto.title = titulo.text
        //tags.
        //newPhoto.tags =
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            newPhoto.latitude = locMan.location?.coordinate.latitude
            newPhoto.longitude = locMan.location?.coordinate.longitude
        }
        newPhoto.imageLocation = "newPhoto"
        newPhoto.city = "Mock"
        newPhoto.state = "RS"
        let tag: MockTag = MockTagDAO.getTag("Cultura")
        newPhoto.tags = [tag]
    
        MockPhotoDAO.inserir(newPhoto)
        
        self.performSegueWithIdentifier("goMap", sender: self)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
