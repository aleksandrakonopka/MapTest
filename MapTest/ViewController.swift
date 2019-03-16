//
//  ViewController.swift
//  MapTest
//
//  Created by Aleksandra Konopka on 16/03/2019.
//  Copyright © 2019 Aleksandra Konopka. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate{
    
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var textField: UITextField!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myMap.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        self.myMap.showsUserLocation = true
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if textField.text != ""
        {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(textField.text!) { (places, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                if let places = places
                {
                    print(places.first!.location!.coordinate.latitude)
                    print(places.first!.location!.coordinate.longitude)
                }
            }
        }
    }
}

