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

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var meuMapa: MKMapView!
    
    @IBOutlet weak var searchField: UISearchBar!
    
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if MockPhotoDAO.buscarTodos().count == 0 {
            MockPhotoDAO.loadDB()
        }
        
        self.setupLocation()
        self.checkLocationAuth()
        self.setRadius(currentLocation)
        // Do any additional setup after loading the view, typically from a nib.
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
    
    

}

