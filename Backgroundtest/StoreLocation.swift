//
//  StoreLocation.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 12/1/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import Foundation
import CoreLocation

struct StoreLocation {
    
    let storeName: String?
    let latitude: String?
    let longitude: String?
    let location: CLLocationCoordinate2D?
    
    init(storeName: String, latitude: String, longitude: String) {
        
        self.storeName = storeName
        self.latitude = latitude
        self.longitude = longitude
        if let lat = Double(latitude), let long = Double(longitude) {
            self.location = CLLocationCoordinate2DMake(lat, long)
        } else {
            self.location = CLLocationCoordinate2DMake(21.549950, 39.153787)
        }
    }
}
