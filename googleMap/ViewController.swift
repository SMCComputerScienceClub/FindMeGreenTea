//
//  ViewController.swift
//  googleMap
//
//  Created by Vinson Han on 10/16/18.
//  Copyright © 2018 Vinson Han. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.022268, longitude: -118.4751741, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 34.022268, longitude: -118.4751741)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
    }

}

