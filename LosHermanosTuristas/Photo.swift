//
//  Photo.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
   convenience init() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let entityDescriptiption: NSEntityDescription = NSEntityDescription.entityForName("Photo", inManagedObjectContext: context)!
        
        self.init(entity: entityDescriptiption, insertIntoManagedObjectContext: context)
    }
    /*
      convenience
      init(city:String, state: String, latitude: Double, longitude: Double, date: NSDate, title:String, descr:String, imageLocation: String, tags:NSSet?) {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let entityDescriptiption: NSEntityDescription = NSEntityDescription.entityForName("Photo", inManagedObjectContext: context)!
        
        self.init(entity: entityDescriptiption, insertIntoManagedObjectContext: context)
        
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.title = title
        self.descr = descr
        self.imageLocation = imageLocation
        self.tags = tags
        
    }
 */
}
