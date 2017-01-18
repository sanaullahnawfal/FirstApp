//
//  LocationViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/21/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var Stores = [StoreLocation]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            print(location)
            
        }
        
    }
    
}
