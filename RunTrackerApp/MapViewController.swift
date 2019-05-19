//
//  MapViewController.swift
//  RunTrackerApp
//
//  Created by Parker Wokwicz on 4/23/19.
//  Copyright © 2019 Ashwin Kasargode. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var region = MKCoordinateRegion()
    var mapItems = [MKMapItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "preserve"
        request.region = region
        let search = MKLocalSearch (request: request)
        search.start { (response, Error) in
            if let response = response {
                for mapItem in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = mapItem.placemark.coordinate
                    annotation.title = mapItem.name
                    self.mapView.addAnnotation(annotation)
                    self.mapItems.append(mapItem)
                }
            }
        }
    }
}
