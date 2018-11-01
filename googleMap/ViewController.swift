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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.022268, longitude: -118.4751741, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 34.022268, longitude: -118.4751741)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

        
        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=34.022268,-118.4751741&radius=1500&type=restaurant&keyword=bar&key=AIzaSyCZhoUIdWNZcA3R7FR2CX8wcZnprAZLfaY").responseJSON { response in
            let json = JSON(response.result.value)
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

}

