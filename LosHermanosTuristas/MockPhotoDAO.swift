//
//  MockPhotoDAO.swift
//  LosHermanosTuristas
//
//  Created by AAgustini on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation

class MockPhotoDAO {
    private static var photos: [MockPhoto] = [MockPhoto]()
  
    
    static func inserir(photo: MockPhoto) {
        photos.append(photo)
        for t:MockTag in photo.tags {
            t.photos.insert(photo)
        }
        print ("+ photo: " + photo.city! + " " + photo.title!)
    }
    
    static func buscarTodos() -> [MockPhoto]{
        return photos
    }
    

    static func buscarPhotos(filter: String) -> [String: [MockPhoto]] {

        // retornar um dicionario <"Local/Estado", [Photo]>
        var result:[String:[MockPhoto]] = [String:[MockPhoto]]()

        for photo in photos where (photo.city!.rangeOfString(filter) != nil) ||
            (photo.title!.rangeOfString(filter) != nil) {
            let key=photo.city! + "/" + photo.state!
            if result[key] == nil {
               result[key] = [MockPhoto]([photo])
            }
            else {
                var temp:[MockPhoto] = result[key]!
                temp += [photo]
                result[key] = temp
           }
    
        let filterTags = MockTagDAO.buscarPhotos(filter);

        for photo in filterTags {
            let key=photo.city! + "/" + photo.state!
            if result[key] != nil {
                 var value = result[key]!
                 value += [photo]
                result[key] = value
        }
            else {
                result[key] = [MockPhoto]([photo])
                
           }      
        }
        
      }
        return result;
    }
 



    static func loadDB() {
        let tag1 = MockTag(); tag1.nameTag = "Natureza"; MockTagDAO.inserir(tag1)
        let tag2 = MockTag(); tag2.nameTag = "Educação"; MockTagDAO.inserir(tag2)
        let tag3 = MockTag(); tag3.nameTag = "Esportes"; MockTagDAO.inserir(tag3)
        
        let tag4 = MockTag(); tag4.nameTag = "Cultura"; MockTagDAO.inserir(tag4)
        let tag5 = MockTag(); tag5.nameTag = "Religião"; MockTagDAO.inserir(tag5)
        let tag6 = MockTag(); tag6.nameTag = "Praia"; MockTagDAO.inserir(tag6)
        let tag7 = MockTag(); tag7.nameTag = "Serra"; MockTagDAO.inserir(tag7)
     
        let f1:MockPhoto = MockPhoto()
        f1.city = "Porto Alegre"
        f1.state = "RS"
        f1.latitude = -30.142051
        f1.longitude = -51.2281772
        f1.date = NSDate(dateString:"2014-06-06")
        f1.title = "Praia de Ipanema"
        f1.descr = "Praia de águas doces do Rio Guaiba"
        f1.imageLocation = "foto1"
        f1.tags = Set([tag1, tag6, tag3])
        MockPhotoDAO.inserir(f1)
        
        let f2:MockPhoto = MockPhoto()
        f2.city = "Porto Alegre"
        f2.state = "RS"
        f2.latitude = -30.2465428
        f2.longitude = -51.071767
        f2.date = NSDate(dateString:"2014-06-06")
        f2.title = "Praia do Lami"
        f2.descr = "Praia de águas doces próximo a capital gaucha"
        f2.imageLocation = "foto2"
        f2.tags = Set([tag1, tag6])
        MockPhotoDAO.inserir(f2)
        
        let f3:MockPhoto = MockPhoto()
        f3.city = "Porto Alegre"
        f3.state = "RS"
        f3.latitude = -30.0338556
        f3.longitude = -51.231069
        f3.date = NSDate(dateString:"2014-06-06")
        f3.title = "Catedral Metropolitana"
        f3.descr = "Catetedral da capital gaucha"
        f3.imageLocation = "foto3"
        f3.tags = Set([tag4, tag5])
        MockPhotoDAO.inserir(f3)
        
        let f4:MockPhoto = MockPhoto()
        f4.city = "Porto Alegre"
        f4.state = "RS"
        f4.latitude = -30.0370063
        f4.longitude = -51.2155418
        f4.date = NSDate(dateString:"2014-06-06")
        f4.title = "Igreja do Santo Sacramento"
        f4.descr = "Bela igreja na capital gaucha"
        f4.imageLocation = "foto4"
        f4.tags = Set([tag4, tag5])
        MockPhotoDAO.inserir(f4)
        
        let f5:MockPhoto = MockPhoto()
        f5.city = "Porto Alegre"
        f5.state = "RS"
        f5.latitude = -30.060641
        f5.longitude = -51.1765295
        f5.date = NSDate(dateString:"2014-06-06")
        f5.title = "FACIN PUCRS"
        f5.descr = "Faculdade de informática da PUCRS"
        f5.imageLocation = "foto5"
        f5.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f5)
        
        let f6:MockPhoto = MockPhoto()
        f6.city = "Porto Alegre"
        f6.state = "RS"
        f6.latitude = -30.055926
        f6.longitude = -51.1733568
        f6.date = NSDate(dateString:"2014-06-06")
        f6.title = "Estádio PUCRS"
        f6.descr = "Estádio Universitário da PUCRS"
        f6.imageLocation = "foto6"
        f6.tags = Set([tag1, tag2, tag3, tag4])
        MockPhotoDAO.inserir(f6)
        
        let f7:MockPhoto = MockPhoto()
        f7.city = "Porto Alegre"
        f7.state = "RS"
        f7.latitude = -30.057461
        f7.longitude = -51.1733163
        f7.date = NSDate(dateString:"2014-06-06")
        f7.title = "Capela PUCRS"
        f7.descr = "Capela Universitára da PUCRS"
        f7.imageLocation = "foto7"
        f7.tags = Set([tag2, tag4, tag5])
        MockPhotoDAO.inserir(f7)
        
        let f8:MockPhoto = MockPhoto()
        f8.city = "Porto Alegre"
        f8.state = "RS"
        f8.latitude = -30.0592087
        f8.longitude = -51.1729518
        f8.date = NSDate(dateString:"2014-06-06")
        f8.title = "Parque Tecnológico PUCRS"
        f8.descr = "TECNOPUC - Parque tecnlógico da PUCRS"
        f8.imageLocation = "foto8"
        f8.tags = Set([tag2])
        MockPhotoDAO.inserir(f8)
        
        let f9:MockPhoto = MockPhoto()
        f9.city = "Porto Alegre"
        f9.state = "RS"
        f9.latitude = -30.0585022
        f9.longitude = -51.1762618
        f9.date = NSDate(dateString:"2014-06-06")
        f9.title = "Museu PUCRS"
        f9.descr = "Museu de Ciência e Tecnologia da PUCRS"
        f9.imageLocation = "foto9"
        f9.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f9)
        
        
        
        let f10:MockPhoto = MockPhoto()
        f10.city = "Porto Alegre"
        f10.state = "RS"
        f10.latitude = -30.0585022
        f10.longitude = -51.1762618
        f10.date = NSDate(dateString:"2014-06-06")
        f10.title = "Museu PUCRS"
        f10.descr = "Museu de Ciência e Tecnologia da PUCRS"
        f10.imageLocation = "foto10"
        f10.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f10)
   
        let f11:MockPhoto = MockPhoto()
        f11.city = "Capão da Canoa"
        f11.state = "RS"
        f11.latitude = -29.7308512
        f11.longitude = -50.007425
        f11.date = NSDate(dateString:"2014-06-06")
        f11.title = "Praia dos Barros"
        f11.descr = "Praia de águas doces no litoral gaucho"
        f11.imageLocation = "foto1"
        f11.tags = Set([tag1, tag6, tag3])
        MockPhotoDAO.inserir(f11)
        
        let f12:MockPhoto = MockPhoto()
        f12.city = "Capão da Canoa"
        f12.state = "RS"
        f12.latitude = -29.742469
        f12.longitude = -50.0033049
        f12.date = NSDate(dateString:"2014-06-06")
        f12.title = "Praia Centro"
        f12.descr = "Praia gaúcha paradisíca"
        f12.imageLocation = "foto2"
        f12.tags = Set([tag1, tag6])
        MockPhotoDAO.inserir(f12)
        
        let f13:MockPhoto = MockPhoto()
        f13.city = "Capão da Canoa"
        f13.state = "RS"
        f13.latitude = -29.7611621
        f13.longitude = -50.0184895
        f13.date = NSDate(dateString:"2014-06-06")
        f13.title = "Igreja Nossa Senhora de Lurdes"
        f13.descr = "Igreja católica"
        f13.imageLocation = "foto3"
        f13.tags = Set([tag4, tag5])
        MockPhotoDAO.inserir(f13)
        
        let f14:MockPhoto = MockPhoto()
        f14.city = "Porto Alegre"
        f14.state = "PI"
        f14.latitude = -6.9710012
        f14.longitude = -44.2006704
        f14.date = NSDate(dateString:"2014-06-06")
        f14.title = "Centro da cidade"
        f14.descr = "Pequena cidade com uma igreja peculiar"
        f14.imageLocation = "foto4"
        f14.tags = Set([tag4, tag5])
        MockPhotoDAO.inserir(f14)
        
        let f15:MockPhoto = MockPhoto()
        f15.city = "Rio de Janeiro"
        f15.state = "RJ"
        f15.latitude = -22.9548319
        f15.longitude = -43.1759376
        f15.date = NSDate(dateString:"2014-06-06")
        f15.title = "Reitoria UFRJ"
        f15.descr = "Reitoria da UFRJ"
        f15.imageLocation = "foto5"
        f15.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f15)
        
        let f16:MockPhoto = MockPhoto()
        f16.city = "Rio de Janeiro"
        f16.state = "RJ"
        f16.latitude = -22.9121015
        f16.longitude = -43.2312448
        f16.date = NSDate(dateString:"2014-06-06")
        f16.title = "Estádio Maracanã"
        f16.descr = "Estádio das finais da copa do mundo 2012 e olimpíadas 2016"
        f16.imageLocation = "foto6"
        f16.tags = Set([tag1, tag2, tag3, tag4])
        MockPhotoDAO.inserir(f16)
        
        let f17:MockPhoto = MockPhoto()
        f17.city = "Rio de Janeiro"
        f17.state = "RJ"
        f17.latitude = -22.9106753
        f17.longitude = -43.1813027
        f17.date = NSDate(dateString:"2014-06-06")
        f17.title = "Catedetral Rio"
        f17.descr = "Catedral Metropolitana do RIO"
        f17.imageLocation = "foto7"
        f17.tags = Set([tag2, tag4, tag5])
        MockPhotoDAO.inserir(f17)
        
        let f18:MockPhoto = MockPhoto()
        f18.city = "Rio de Janeiro"
        f18.state = "RJ"
        f18.latitude = -22.8673524
        f18.longitude = -43.215454
        f18.date = NSDate(dateString:"2014-06-06")
        f18.title = "Parque Tecnológico UFRJ"
        f18.descr = "Parque tecnlógico da PUCRS"
        f18.imageLocation = "foto8"
        f18.tags = Set([tag2])
        MockPhotoDAO.inserir(f18)
        
        let f19:MockPhoto = MockPhoto()
        f19.city = "Rio de Janeiro"
        f19.state = "RJ"
        f19.latitude = -22.9057495
        f19.longitude = -43.2268132
        f19.date = NSDate(dateString:"2014-06-06")
        f19.title = "Museu Nacional"
        f19.descr = "National Museum of Brazil"
        f19.imageLocation = "foto9"
        f19.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f19)
        
        
        
        let f20:MockPhoto = MockPhoto()
        f20.city = "Rio de Janeiro"
        f20.state = "RJ"
        f20.latitude = -22.9133922
        f20.longitude = -43.1727714
        f20.date = NSDate(dateString:"2014-06-06")
        f20.title = "Museu"
        f20.descr = "Museu de Arte Moderna"
        f20.imageLocation = "foto10"
        f20.tags = Set([tag2, tag4])
        MockPhotoDAO.inserir(f20)
        
       
 
  }
}