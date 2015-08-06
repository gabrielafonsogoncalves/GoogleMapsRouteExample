//
//  GBTransportationViewController.swift
//  GoogleMapsTestSwift
//
//  Created by Gabriel Alejandro Afonso Goncalves on 8/4/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

import UIKit

class GBTransportationViewController: UIViewController, GBTransportationMethodDelegate {

    @IBOutlet weak var methodsTableView: UITableView?
    var transportationMethodsDataSource: GBTransportationMethodTableViewDataSource?
    var delegate: MapViewDelegate?
    
    //MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareTransportationMethods()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private methods
    
    private func prepareTransportationMethods() {
        self.transportationMethodsDataSource = GBTransportationMethodTableViewDataSource(delegate: self)
        self.methodsTableView?.delegate = self.transportationMethodsDataSource
        self.methodsTableView?.dataSource = self.transportationMethodsDataSource
    }
    
    private func closeView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func closeView(sender: UIButton) {
        self.closeView()
    }
    
    //MARK: TransportationMethodDelegate
    
    func methodSelected(method: String) {
        self.delegate?.transportationMethodSelected(method)
        self.closeView()
    }
}