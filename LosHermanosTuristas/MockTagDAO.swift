//
//  MockTagDAO.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//


import Foundation

class MockTagDAO {

    private static var tags: [MockTag] = [MockTag]();

    static func inserir(tag: MockTag) {
        tags.append(tag)
 //       print("+ tag:" + tag.nameTag!)
    }
    
    static func buscarTodos() -> [MockTag]{
        return tags
    }

    static func buscarTag(filter: String) -> [MockTag] {
        var result:[MockTag] = [MockTag]()

        for tag in tags where tag.nameTag == filter {
            result.append(tag)
        }
        return result
    }

    static func buscarPhotos(filter:String) -> [MockPhoto] {
        var result:[MockPhoto] = [MockPhoto]()

        for tag in tags where tag.nameTag == filter {
            //result.append(Array(tag.photos))
            for ph in tag.photos {
                result.append(ph)
            }
        }
        return result
    }
    
}