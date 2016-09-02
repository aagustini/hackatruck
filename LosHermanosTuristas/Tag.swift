//
//  Tag.swift
//  LosHermanosTuristas
//
//  Created by Student on 9/2/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation
import CoreData


class Tag: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    init(tag:String) {
        self.nameTag = tag
    }
}
