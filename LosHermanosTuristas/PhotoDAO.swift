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
        
        print("vou inserir: " + photo.city! + " " + photo.imageLocation!)
        do {
            try context.save()
            print("inseriu nova foto")
        } catch let error as NSError {
            print(error)
        }
    }
    
    static func buscarTodos() -> [Photo]{
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        var photos: [Photo] = [Photo]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Photo")
        
    
        do{
            photos = try context.executeFetchRequest(request) as! [Photo]
            
        } catch let error as NSError {
            print("buscar photos error:")
            print(error)
        }
        
        return photos
    }
    
    

    static func loadDB() {
        let tag1 = Tag(); tag1.nameTag = "Natureza"; TagDAO.inserir(tag1)
        let tag2 = Tag(); tag2.nameTag = "Educação"; TagDAO.inserir(tag2)
        let tag3 = Tag(); tag3.nameTag = "Esportes"; TagDAO.inserir(tag3)
        
        let tag4 = Tag(); tag4.nameTag = "Cultura"; TagDAO.inserir(tag4)
        let tag5 = Tag(); tag5.nameTag = "Religião"; TagDAO.inserir(tag5)
        let tag6 = Tag(); tag6.nameTag = "Praia"; TagDAO.inserir(tag6)
        let tag7 = Tag(); tag7.nameTag = "Serra"; TagDAO.inserir(tag7)
        
        let tagSet1 = NSSet(array: [tag2, tag4])
        let tagSet2 = NSSet(array: [tag1, tag3, tag6])
        let tagSet3 = NSSet(array: [tag1, tag7])
        let tagSet4 = NSSet(array: [tag4, tag5])
        
      
        // lat, long poa: -30.036550, -51.240965
        
       
        let f1:Photo = Photo()
        f1.city = "Porto Alegre"
        f1.state = "RS"
        f1.latitude = -30.036550
        f1.longitude = -51.240965
        f1.date = NSDate(dateString:"2014-06-06")
        f1.title = "PUCRS"
        f1.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f1.imageLocation = "foto1"
        f1.tags = tagSet1
        PhotoDAO.inserir(f1)
        
        let f2:Photo = Photo()
        f2.city = "Porto Alegre"
        f2.state = "RS"
        f2.latitude = -30.036550
        f2.longitude = -51.240965
        f2.date = NSDate(dateString:"2014-06-06")
        f2.title = "PUCRS"
        f2.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f2.imageLocation = "foto2"
        f2.tags = tagSet2
        PhotoDAO.inserir(f2)
        
        let f3:Photo = Photo()
        f3.city = "Porto Alegre"
        f3.state = "RS"
        f3.latitude = -30.036550
        f3.longitude = -51.240965
        f3.date = NSDate(dateString:"2014-06-06")
        f3.title = "PUCRS"
        f3.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f3.imageLocation = "foto3"
        f3.tags = tagSet1
        PhotoDAO.inserir(f3)
        
        let f4:Photo = Photo()
        f4.city = "Porto Alegre"
        f4.state = "RS"
        f4.latitude = -30.036550
        f4.longitude = -51.240965
        f4.date = NSDate(dateString:"2014-06-06")
        f4.title = "PUCRS"
        f4.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f4.imageLocation = "foto4"
        f4.tags = tagSet1
        PhotoDAO.inserir(f4)
        
        let f5:Photo = Photo()
        f5.city = "Porto Alegre"
        f5.state = "RS"
        f5.latitude = -30.036550
        f5.longitude = -51.240965
        f5.date = NSDate(dateString:"2014-06-06")
        f5.title = "PUCRS"
        f5.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f5.imageLocation = "foto5"
        f5.tags = tagSet3
        PhotoDAO.inserir(f5)
        
        let f6:Photo = Photo()
        f6.city = "Porto Alegre"
        f6.state = "RS"
        f6.latitude = -30.036550
        f6.longitude = -51.240965
        f6.date = NSDate(dateString:"2014-06-06")
        f6.title = "PUCRS"
        f6.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f6.imageLocation = "foto6"
        f6.tags = tagSet1
        PhotoDAO.inserir(f6)
        
        let f7:Photo = Photo()
        f7.city = "Porto Alegre"
        f7.state = "RS"
        f7.latitude = -30.036550
        f7.longitude = -51.240965
        f7.date = NSDate(dateString:"2014-06-06")
        f7.title = "PUCRS"
        f7.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f7.imageLocation = "foto7"
        f7.tags = tagSet2
        PhotoDAO.inserir(f7)
        
        let f8:Photo = Photo()
        f8.city = "Porto Alegre"
        f8.state = "RS"
        f8.latitude = -30.036550
        f8.longitude = -51.240965
        f8.date = NSDate(dateString:"2014-06-06")
        f8.title = "PUCRS"
        f8.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f8.imageLocation = "foto8"
        f8.tags = tagSet2
        PhotoDAO.inserir(f8)
        
        let f9:Photo = Photo()
        f9.city = "Porto Alegre"
        f9.state = "RS"
        f9.latitude = -30.036550
        f9.longitude = -51.240965
        f9.date = NSDate(dateString:"2014-06-06")
        f9.title = "PUCRS"
        f9.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f9.imageLocation = "foto9"
        f9.tags = tagSet4
        PhotoDAO.inserir(f9)
        
        
        
        let f10:Photo = Photo()
        f10.city = "Porto Alegre"
        f10.state = "RS"
        f10.latitude = -30.036550
        f10.longitude = -51.240965
        f10.date = NSDate(dateString:"2014-06-06")
        f10.title = "PUCRS"
        f10.descr = "Pontifícia Universidade Católica do Rio Grande do Sul"
        f10.imageLocation = "foto10"
        f10.tags = tagSet4
        PhotoDAO.inserir(f10)
        
        /*
        
        let photo2 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto2", tags: tagSet2)
        
        let photo3 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto3", tags: tagSet3)
        
        let photo4 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto4", tags: tagSet1)
        
        let photo5 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto5", tags: tagSet4)
        
        let photo6 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto6", tags: tagSet4)
        
        let photo7 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto7", tags: tagSet1)
        
        let photo8 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto8", tags: tagSet2)
  
        let photo9 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto9", tags: tagSet4)
        
        let photo10 = Photo(city: "Porto Alegre", state: "RS", latitude: -30.036550, longitude: -51.240965, date: NSDate(dateString:"2014-06-06"), title: "PUCRS", descr: "Pontifícia Universidade Católica do Rio Grande do Sul", imageLocation: "foto10", tags: tagSet3)
        
 
        PhotoDAO.inserir(f1)
 
 
        PhotoDAO.inserir(photo2)
        PhotoDAO.inserir(photo3)
        PhotoDAO.inserir(photo4)
        PhotoDAO.inserir(photo5)
        PhotoDAO.inserir(photo6)
        PhotoDAO.inserir(photo7)
        PhotoDAO.inserir(photo8)
        PhotoDAO.inserir(photo9)
        PhotoDAO.inserir(photo10)
       */
 
}
 
  }