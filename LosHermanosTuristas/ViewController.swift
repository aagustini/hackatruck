//
//  ViewController.swift
//  LosHermanosTuristas
//
//  Created by Student on 02/09/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var meuMapa: MKMapView!
    
    @IBOutlet weak var searchField: UISearchBar!
    
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    let regionRadius: CLLocationDistance = 1000
    var isZoomed: Bool = false
    var pins: [MockPhoto] = [MockPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if MockPhotoDAO.buscarTodos().count == 0 {
            MockPhotoDAO.loadDB()
            pins = MockPhotoDAO.buscarTodos()
        }
        
        self.setupLocation()
        self.checkLocationAuth()
        self.setRadius(currentLocation)
        // Do any additional setup after loading the view, typically from a nib.
        
        createPins()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLocationAuth() {
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    
    func setupLocation() {
        locationManager = CLLocationManager()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    func setRadius(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        meuMapa.setRegion(coordinateRegion, animated: true)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSearch" {
            if let novaView = segue.destinationViewController as? SearchTableViewController {
                novaView.searchText = self.searchField.text
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            self.currentLocation = locations[0]
            //print("Localização atual = ", locations[0].coordinate)
            
            if !isZoomed {
                let spam: MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
                let region:MKCoordinateRegion = MKCoordinateRegionMake(self.currentLocation.coordinate, spam)
                
                meuMapa.setRegion(region, animated: true)
                
                isZoomed = true
            }
        }
    }
    
    func createPins() {
        //Para cada uma das fotos
        for photo in pins {
            //Cria uma localizacao com base na latitude e longitude da foto
            var coord: CLLocationCoordinate2D = CLLocationCoordinate2D()
            coord.latitude = (photo.latitude)!
            coord.longitude = (photo.longitude)!
            
            //Cria uma anotation
            let annotation: MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = coord
            annotation.title = photo.title
            annotation.subtitle = photo.descr

            meuMapa.addAnnotation(annotation)
        }
    }

}

