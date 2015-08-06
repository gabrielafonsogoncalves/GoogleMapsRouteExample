//
//  GBTransportationMethodTableViewDataSource.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/4/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import UIKit

class GBTransportationMethodTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var methods: NSArray = ["driving", "walking", "bicycling", "transit"]
    var delegate: GBTransportationMethodDelegate?
    
    init(delegate: GBTransportationMethodDelegate) {
        self.delegate = delegate
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.methods.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("method-cell") as! UITableViewCell
        cell.textLabel?.text = self.methods[indexPath.row] as? String
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.methodSelected(self.methods[indexPath.row] as! String)
    }
}
