//
//  Photo+CoreDataProperties.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Photo {

    @NSManaged var city: String?
    @NSManaged var descr: String?
    @NSManaged var imageLocation: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var state: String?
    @NSManaged var title: String?
    @NSManaged var date: NSDate?
    @NSManaged var tags: NSSet?

}
