//
//  GBPolylineBuilder.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBPolylineBuilder: NSObject, GBObjectBuilder {

    var context: GBBuilder?
    
    func buildFromDictionary(dictionary: [String : AnyObject]) -> AnyObject? {
        var polyline = GBPolyline()
        polyline.overviewPolyline = dictionary[GBConstants.Parser.Points] as? String
        
        return polyline
    }
}
