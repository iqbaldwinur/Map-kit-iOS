//
//  ViewController.swift
//  Map kit iOS
//
//  Created by Iqbal Dwi Nur Khoirul anam on 22/10/18.
//  Copyright © 2018 iqbal project. All rights reserved.
//

import UIKit
// akses map kit
import MapKit


// import mapkit
class ViewController: UIViewController,CLLocationManagerDelegate {
    

    @IBOutlet weak var mkView: MKMapView!
    
    
    var gps = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        gps.delegate = self
        
      
        
        
        // membuat atau menambahkan pin pada peta
        pinMaker(lat: -6.1584235, long: 106.5610025, title: "Lokasi Saya")
        pinMaker(lat:  -6.1554126, long: 106.5674749, title: "lokasi kedua")
        pinMaker(lat: -6.1589149, long: 106.561584, title: "Masjid Almakmur")
        
        
        // minta lokasi
        gps.requestLocation()
        gps.requestAlwaysAuthorization()
        
/*
        // Do any additional setup after loading the view, typically from a nib.
        
        // menentukan koordinat awal ketika apllikasi di run
        let coordinate = CLLocationCoordinate2D(latitude: -6.1584235, longitude: 106.5610025)
        
        
        let coordinate2 = CLLocationCoordinate2D(latitude: -6.52526536, longitude: 107.035952)
        // menentukan seberapa dekat dengan permukaan bumi
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
      
        mkView.region = MKCoordinateRegion(center: coordinate, span: span)
        
        
        
        
        
        
        // menambahkan pin/marker ke maps
        let pin = MKPointAnnotation()
        let pin2 = MKPointAnnotation()
        
        
        
        
        // posisi pin
        pin.coordinate = coordinate
        pin2.coordinate = coordinate2
        
        
        // title pin
        pin.title = "Lokasi sekarang"
        pin2.title = "lokasi kedua"
        mkView.addAnnotation(pin)
        mkView.addAnnotation(pin2)
        

        // setting map kit
        mkView.isZoomEnabled = true
        mkView.mapType = MKMapType.hybridFlyover
*/
    }
    
    
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let lokasiku = locations.last?.coordinate
        
        //add pin in maps
        let pin = MKPointAnnotation()
        
        //title pin
        
        
        
        mkView.addAnnotation(pin)
        
        mkView.centerCoordinate = lokasiku!

 
    
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    PtdP
    func pinMaker(lat: Double, long:Double, title: String){
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 0.056, longitudeDelta: 0.056)
        
        mkView.region = MKCoordinateRegion(center: coordinate, span: span)
        
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = title
        
        mkView.addAnnotation(pin)
        
        
    }


}

