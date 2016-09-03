//
//  MockPhoto.swift
//  LosHermanosTuristas
//
//  Created by AAgustini on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation


class MockPhoto : Hashable {
    private static var nextId: Int = 0

    let photoId: Int
    var city: String?
    var date: NSDate?
    var descr: String?
    var imageLocation: String?
    var latitude: Double?
    var longitude: Double?
    var state: String?
    var title: String?
    var tags: Set<MockTag>

    init() {
       self.photoId = MockPhoto.nextId
       MockPhoto.nextId += 1
       self.tags = Set<MockTag>()

        
        /* self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.title = title
        self.descr = descr
        self.imageLocation = imageLocation
        self.tags = tags
        */

    }

    var hashValue: Int {
        return self.photoId
    }
}

func ==(lhs: MockPhoto, rhs: MockPhoto) -> Bool {
    return lhs.photoId == rhs.photoId
}

