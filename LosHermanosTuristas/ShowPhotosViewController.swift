//
//  ShowPhotosViewController.swift
//  LosHermanosTuristas
//
//  Created by Alexandre  on 9/4/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit

class ShowPhotosViewController: UIViewController {
    
    var photos: [MockPhoto]? = [MockPhoto]()
    var numPhotos: Int  = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       loadData(0)
        
        self.photoSlider.minimumValue = 0
        self.photoSlider.maximumValue = Float(numPhotos)
        self.photoSlider.value = 0
        self.sliderLabel.text = "1/" + String(numPhotos)
    }
    
    func loadData(index: Int) {
        if photos != nil {
           
            let photo = photos![index]
           
            self.imageView.image = UIImage(named: photo.imageLocation!)
            self.cityLabel.text = photo.city!
            self.descricaoLabel.text = photo.descr
            self.tituloLabel.text = photo.title
            
            var tagStr:String =  "Tags: "
            for tag in photo.tags {
                tagStr += " " + tag.nameTag!
            }
            
            self.tagsLabel.text = tagStr
            self.numPhotos = (photos?.count)!
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let pos = sender.value
        print("sender value: " + String(pos))
       
        print("pos: " + String(pos))
        
        let index = (Int( pos )) % numPhotos
        
        sliderLabel.text = String((index+1)) + "/" + String((photos?.count)!)
        loadData(index)
        
        
    }
    // MARK: Properties

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var photoSlider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
}
