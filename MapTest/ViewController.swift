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
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotationWZIM = MKPointAnnotation()
        let annotationJezyki = MKPointAnnotation()
        let annotations = [annotationWZIM,annotationJezyki]
        annotationWZIM.coordinate = CLLocationCoordinate2DMake(52.161992, 21.046240)
        annotationJezyki.coordinate = CLLocationCoordinate2DMake(52.157267, 21.044686)
        annotationWZIM.title = "Budynek 34"
        annotationWZIM.subtitle = "Wydział Zastosowań Informatyki i Matematyki"
        annotationJezyki.title = "Budynek Językowy"
        annotationJezyki.subtitle = "Język Angielski"
        self.myMap.addAnnotations(annotations)
        
        self.myMap.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        self.myMap.mapType = .standard
        //self.myMap.mapType = .satellite
        //self.myMap.mapType = .hybrid
        locationManager.startUpdatingLocation()
        self.myMap.showsUserLocation = true
    }
}

