//
//  GBMapService.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBMapService: GBAbstractService, GBConnectionDelegate {
    
    var connectionService: GBConnectionService?
    var delegate: GBMapServiceDelegate?
    
    init(delegate: GBMapServiceDelegate) {
        super.init()
        self.delegate = delegate
        self.connectionService = GBConnectionService()
    }
    
    //MARK: Public methods
    
    func routeFromOrigin(origin: CLLocationCoordinate2D, toDestination destination: CLLocationCoordinate2D, transportationMethod: String) {
        var url = "\(GBConstants.GoogleMaps.directionsBaseUrl)?origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false"
        if transportationMethod.isEmpty == false {
            url = "\(url)&mode=\(transportationMethod)"
        }
        
        self.connectionService?.GETRequestToUrl(url, delegate: self)
    }
    
    
    //MARK: GBConnectionDelegate
    
    func gotResponse(response: AnyObject?) {
        if let dictionary = response as? [String : AnyObject] {
            if let routeArray = dictionary[GBConstants.Parser.Routes] as? [AnyObject] {
                if let routeDictionary = routeArray.first as? [String: AnyObject] {
                    let trip = self.builder.build(NSStringFromClass(GBTrip), fromDictionary: routeDictionary) as? GBTrip
                    self.delegate?.routeIdFetched(trip?.polyline!.overviewPolyline)
                }
            }
        }
    }
}
