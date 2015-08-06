//
//  GBAbstractService.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBAbstractService: NSObject {
    
    var builder: GBBuilder
    
    override init() {
        builder = GBBuilder()
    }
}
