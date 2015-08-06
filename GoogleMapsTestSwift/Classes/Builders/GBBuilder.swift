//
//  GBBuilder.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBBuilder: NSObject {
    
    var builders: [String: AnyObject] = [String: AnyObject]()
    var loaded: Bool = false
    
    func build(className: String, fromDictionary dictionary: [String: AnyObject]?) -> AnyObject? {
        if dictionary == nil {
            return nil
        }
        
        if !loaded {
            self.loadBuilders()
        }
        
        if let builder = self.builders[className] as? GBObjectBuilder {
            return builder.buildFromDictionary(dictionary!)
        }
        
        
        return nil
    }
    
    private func loadBuilders() {
        var tripBuilder = GBTripBuilder()
        tripBuilder.context = self
        builders.updateValue(tripBuilder, forKey: NSStringFromClass(GBTrip))
        
        var polylineBuilder = GBPolylineBuilder()
        polylineBuilder.context = self
        builders.updateValue(polylineBuilder, forKey: NSStringFromClass(GBPolyline))
    }
}