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
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManger = CLLocationManager()
    var lat: Double = 0.0
    var long: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If testing out on simulator. Adjust GPS location by going to Simulator->Debug->Location and restart app
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
       
        if let location = locationManger.location {
            lat = location.coordinate.latitude
            long = location.coordinate.longitude
        }
        print(lat)
        print(long)
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "Cuurent Location"
        marker.snippet = "lat \(lat) and long \(long)"
        marker.map = mapView

        
        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(long)&radius=1500&type=restaurant&keyword=bar&key=AIzaSyCZhoUIdWNZcA3R7FR2CX8wcZnprAZLfaY").responseJSON { response in
            let json = JSON(response.result.value)
            print(json)
            for i in 0..<json["results"].count {
                let marker = GMSMarker()
                let lat = json["results"][i]["geometry"]["location"]["lat"].double!
                let lng = json["results"][i]["geometry"]["location"]["lng"].double!
                marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)


                marker.title = json["results"][i]["name"].string
                marker.snippet = "Rating: \(json["results"][i]["rating"].double!)"
                marker.map = mapView
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {

            self.locationManger.stopUpdatingLocation()
            //print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)

        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

