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
        
        print("vou inserir: " + tag.nameTag!)
        do {
            try context.save()
            print("inseriu nova tag: " + tag.nameTag!)
        } catch let error as NSError {
            print(error)
        }
    }
    
    static func buscarTodos() -> [Tag]{
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        var tags: [Tag] = [Tag]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Tag")
        
        request.sortDescriptors = [NSSortDescriptor.init(key: "nameTag", ascending: true)]
        
        do{
            tags = try context.executeFetchRequest(request) as! [Tag]
            
        } catch let error as NSError {
            print("buscar tags error:")
            print(error)
        }
        
        return tags
    }
    
    
}