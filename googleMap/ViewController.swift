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
      
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.022268, longitude: -118.4751741, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 34.022268, longitude: -118.4751741)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=34.022268,-118.4751741&radius=1500&type=restaurant&keyword=bar&key=AIzaSyCZhoUIdWNZcA3R7FR2CX8wcZnprAZLfaY").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
            
            let json2 = JSON(response.result.value)
            if let barName = json2["results"][0]["name"].string {
                //Now you got your value
                print(barName)
            }
            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
        }
        

    }

}

