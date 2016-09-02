//
//  File.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation
import UIKit
import CoreData

  extension NSDate
    {
        convenience
        init(dateString:String) {
            let dateStringFormatter = NSDateFormatter()
            dateStringFormatter.dateFormat = "yyyy-MM-dd"
            dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
            let d = dateStringFormatter.dateFromString(dateString)!
            self.init(timeInterval:0, sinceDate:d)
        }
    }

class PhotoDAO {
 
  
    
    static func inserir(photo: Photo) {
        
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        context.insertObject(photo)
        
        do {
            try context.save()
            print("inseriu nova foto")
        } catch let error as NSError {
            print(error)
        }
    }

    static func loadDB() {
        
        let tag1 = Tag(tag: "Natureza")
        let tag2 = Tag(tag: "Educação")
        let tag3 = Tag(tag: "Esportes")
        let tag4 = Tag(tag: "Cultura")
        let tag5 = Tag(tag: "Religião")
        let tag6 = Tag(tag: "Praia")
        let tag7 = Tag(tag: "Serra")
        
        
        let tagSet1 = NSSet(array: [tag2, tag4])
        let tagSet2 = NSSet(array: [tag1, tag6])
        let tagSet3 = NSSet(array: [tag1, tag7])
        let tagSet4 = NSSet(array: [tag4, tag5])
      
        // lat, long poa: -30.036550, -51.240965
        
        let photo1 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto1", tags: tagSet1)
     
        let photo2 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto2", tags: tagSet1)
        
        let photo3 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto3", tags: tagSet1)
        
        let photo4 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto4", tags: tagSet1)
        
        let photo5 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto5", tags: tagSet1)
        
        let photo6 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto6", tags: tagSet1)
        
        let photo7 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto7", tags: tagSet1)
        
        let photo8 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto8", tags: tagSet1)
  
        let photo9 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto9", tags: tagSet1)
        
        let photo10 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto10", tags: tagSet1)
        

 
        
        
        
    }
    
    
}