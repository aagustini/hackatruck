//
//  ViewControllerAbout.swift
//  LosHermanosTuristas
//
//  Created by Alexandre  on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit

class ViewControllerAbout: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    @IBAction func testarBancoDados(sender: AnyObject) {
    
        let photos = MockPhotoDAO.buscarTodos()
        print(" ")
        print("Buscar photos count: " + String(photos.count))
        for photo in photos {
            print("<f> " + photo.city! + " " + photo.title!)
            for tag:MockTag in photo.tags {
                print("   -> " + tag.nameTag!)
            }
        }
        
        let tags = MockTagDAO.buscarTodos()
        print(" ")
        print("Buscar tags count: " + String(tags.count))
        for tag in tags {
            print("<t> " + tag.nameTag!)
            for foto:MockPhoto in tag.photos {
                print("   -> " + foto.city! + " " + foto.imageLocation! )
            }	
        }
        
        
        
    }
}
