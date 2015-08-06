//
//  GBServiceUtil.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/4/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation

class GBServiceUtil: NSObject {
    
    static func RandomColor() -> UIColor {
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
