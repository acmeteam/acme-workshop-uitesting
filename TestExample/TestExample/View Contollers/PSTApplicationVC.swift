//
//  PSTApplicationVC.swift
//  TestExample
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import UIKit
import CoreLocation

class PSTApplicationVC: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager?.startUpdatingLocation()
            // implement additional logic if needed...
        } else if status == .NotDetermined {
        
            locationManager?.requestAlwaysAuthorization()
        }
    }
    


}
