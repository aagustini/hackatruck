//
//  PhotoSearchViewModel.swift
//  LosHermanosTuristas
//
//  Created by Alexandre  on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import Foundation


class PhotoSearchViewModel {
    let city: String?
    let message: String?
    let imagem: String?
    let id: Int
    
    init(id:Int, city:String, message:String, imagem: String) {
        self.city = city
        self.imagem = imagem
        self.message = message
        self.id = id
    }
}
