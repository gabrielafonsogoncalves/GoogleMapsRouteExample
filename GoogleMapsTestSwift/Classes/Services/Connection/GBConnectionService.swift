//
//  GBConnectionService.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/3/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import Foundation
import Alamofire

class GBConnectionService: NSObject {
    
    func GETRequestToUrl(url: String, delegate: GBConnectionDelegate) {
        Alamofire.request(.GET, url)
            .responseJSON {(request, response, JSON, error) in
                println(JSON)
                delegate.gotResponse(JSON)
        }
    }
}
