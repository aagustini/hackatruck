//
//  TagDAO.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//


import Foundation
import UIKit
import CoreData

class TagDAO {
    
    static func inserir(tag: Tag) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        context.insertObject(tag)
        
        do {
            try context.save()
            print("inseriu nova tag")
        } catch let error as NSError {
            print(error)
        }
    }
    
    
}