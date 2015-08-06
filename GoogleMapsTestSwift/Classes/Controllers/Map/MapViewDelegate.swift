//
//  MapViewDelegate.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/4/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

@objc protocol MapViewDelegate {
    func transportationMethodSelected(method: String)
}