//
//  ViewController.swift
//  HackRussia2016
//
//  Created by Dmitriy on 19/11/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBAction func geolocationButton(_ sender: Any) {
        
        locationManager.startUpdatingLocation()
        
    }
    
    var geocoder: CLGeocoder!
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Var for translate adress to coordinates
        geocoder = CLGeocoder()
        
        searchField.addTarget(self, action: #selector(ViewController.searchFeildDidChanged), for: UIControlEvents.editingChanged)
        
        //
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        
        // freefood test points
        
        let freeFood = CLLocationCoordinate2D(latitude: 60.007604, longitude: 30.373089)
        
        // Mark for map
        
        let freeFoodPlacemark = MKPlacemark(coordinate: freeFood, addressDictionary: nil)
        
        // Add annotation
        
        let foodPlaceAnitation = MKPointAnnotation()
        foodPlaceAnitation.title = "2 киллограмма яблок"
        foodPlaceAnitation.subtitle = "забрать до 8 вечера"
        
        if let location = freeFoodPlacemark.location {
            foodPlaceAnitation.coordinate = location.coordinate
        }
        
        
        // show animation
        
        self.mapView.showAnnotations([foodPlaceAnitation], animated: true )
        determineCurrentLocation()
        
        
    }
    
    func searchFeildDidChanged() {
        
        geocoder.geocodeAddressString((searchField.text!)) { (placemarks, error) ->
            Void in
            if error != nil {
                print("MapKit error \(error?.localizedDescription)")
            }
            if placemarks != nil {
                if let placemark = placemarks?.first {
                    let annotation = MKPointAnnotation()
                    annotation.title = self.searchField.text!
                   // annotation.subtitle = self.searchField.text!
                    annotation.coordinate = placemark.location!.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
         manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        
        
        mapView.setRegion(region, animated: true)
        
       
    }

}

