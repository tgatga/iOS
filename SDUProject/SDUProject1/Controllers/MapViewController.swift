//
//  MapViewController.swift
//  SDUProject1
//
//  Created by Assel Tolebayeva on 07.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

   
    override func loadView() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyBHssqHBa77iU0Ojjf897ocJB3w_Ss3Ylw")
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 43.207845, longitude: 76.668923, zoom:10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

}
