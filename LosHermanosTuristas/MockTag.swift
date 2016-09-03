//
//  MockTag.swift
//  LosHermanosTuristas
//
//  Created by AAgustini on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

class MockTag : Hashable {
    private static var nextTagId: Int = 0
 
    let tagId: Int
    var nameTag: String?
    var photos: Set<MockPhoto>

    
    init() {
       self.tagId = MockTag.nextTagId
       self.photos = Set<MockPhoto>()
       MockTag.nextTagId += 1
    }
    
    var hashValue: Int {
        return self.tagId
    }
}

func ==(lhs: MockTag, rhs: MockTag) -> Bool {
    return lhs.tagId == rhs.tagId
}
    
    

