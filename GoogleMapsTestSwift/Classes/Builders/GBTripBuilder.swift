//
//  GBTripBuilder.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBTripBuilder: NSObject, GBObjectBuilder {

    var context: GBBuilder?
    
    func buildFromDictionary(dictionary: [String: AnyObject]) -> AnyObject? {
        var trip = GBTrip()
        trip.summary = dictionary[GBConstants.Parser.Summary] as? String
        
        if let polylineDictionary = dictionary[GBConstants.Parser.OverviewPolyline] as? [String: AnyObject] {
            trip.polyline = self.context?.build(NSStringFromClass(GBPolyline), fromDictionary: polylineDictionary) as? GBPolyline
        }
        
        return trip;
    }
}
