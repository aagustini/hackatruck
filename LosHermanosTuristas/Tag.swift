//
//  Tag.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Tag: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entityDescriptiption: NSEntityDescription = NSEntityDescription.entityForName("Tag", inManagedObjectContext: context)!
        
        self.init(entity: entityDescriptiption, insertIntoManagedObjectContext: context)
    }
}
