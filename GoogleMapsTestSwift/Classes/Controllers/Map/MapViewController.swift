//
//  ViewController.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, GMSMapViewDelegate, GBMapServiceDelegate, MapViewDelegate {

    var mapView: GMSMapView?
    var mapService: GBMapService?
    var origin: CLLocationCoordinate2D?
    var destination: CLLocationCoordinate2D?
    var originMarkerPlaced: Bool = false
    
    //MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareGoogleMaps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? GBTransportationViewController {
            viewController.delegate = self
        }
    }
    
    //Mark: Private methods
    
    private func prepareGoogleMaps() {
        let target = CLLocationCoordinate2DMake(-33.86, 151.20)
        var camera = GMSCameraPosition(target: target, zoom: 12, bearing: 0, viewingAngle: 0)
        self.mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        self.mapView?.camera = camera
        self.mapView?.myLocationEnabled = true
        self.mapView?.delegate = self
        self.view = self.mapView
        
        if self.mapService == nil {
            self.mapService = GBMapService(delegate: self)
        }
        
        self.origin = target
        self.destination = CLLocationCoordinate2DMake(-33.86, 150.0)
        
        self.mapService?.routeFromOrigin(self.origin!, toDestination: self.destination!, transportationMethod: "")
    }

    //MARK: GMSMapViewDelegate
    
    func mapView(mapView: GMSMapView!, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
        self.destination = coordinate
        self.performSegueWithIdentifier("transportation-methods-segue", sender: self)
    }
    
    //MARK: GBMapServiceDelegate
    
    func routeIdFetched(route: String?) {
        if route == nil || route?.isEmpty == true {
            return
        }
        
        if self.originMarkerPlaced == false && self.origin != nil {
            let marker = GMSMarker(position: self.origin!)
            marker.map = self.mapView
        }
        
        let marker = GMSMarker(position: self.destination!)
        marker.map = self.mapView
        let path = GMSPath(fromEncodedPath: route!)
        let polyline = GMSPolyline(path: path)
        
        polyline.strokeColor = GBServiceUtil.RandomColor()
        polyline.strokeWidth = 5.0
        polyline.map = self.mapView
    }
    
    //MARK: MapViewDelegate
    
    func transportationMethodSelected(method: String) {
        self.mapService?.routeFromOrigin(self.origin!, toDestination: self.destination!, transportationMethod: method)
    }
}