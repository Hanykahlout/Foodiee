//
//  MapViewController.swift
//  Foodiee
//
//  Created by macbook on 30/11/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SCLAlertView
class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var preLocation:CLLocation?
    var locationOfTheRestorent:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization() {
        setRestorentLocation()
        removeBackgroungNavBar()
        mapView.delegate = self
        checkLocationServices()
        
        getDirection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backAction(_ sender: Any) {
        getBack()
    }
    
    @IBAction func orderDetalisAction(_ sender: Any) {
        getBack()
    }
    func putLocationLogoToMapView()  {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 52.033882, longitude: -2.423574)
        mapView.addAnnotation(annotation)
    }
    
    func setRestorentLocation()  {
        locationOfTheRestorent = CLLocationCoordinate2D(latitude: 52.033882, longitude: -2.423574)
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuth()
        }else{
            SCLAlertView().showInfo("You Don't Make premetion for Location in your device", subTitle: "you should go to setting and edit it")
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuth() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            showLocation()
        case .denied:
            SCLAlertView().showInfo("You are denied this app to use GPS to get your location", subTitle: "You should change the permetion for this app")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            SCLAlertView().showInfo( "You Don't have permetion for location", subTitle: "You are restricted for access in location")
            break
        case .authorizedAlways:
            showLocation()
        default:
            break
        }
    }
    func showLocation() {
        mapView.showsUserLocation = true
        putLocationLogoToMapView()
        centerViewInUserLocation()
        locationManager.startUpdatingLocation()
        preLocation = getCurrentLocation(mapView: mapView)
    }
    func centerViewInUserLocation() {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getCurrentLocation(mapView:MKMapView) -> CLLocation {
        return CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
    }
    func getBack() {
        navigationController?.popViewController(animated: true)
    }
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    func getDirection() {
        guard let location = locationManager.location?.coordinate else {
            return
        }
        let request = createDirctionRequest(from: location)
        let direcation = MKDirections(request: request)
        direcation.calculate { [unowned self](response, error) in
            guard let response = response else {return}
            for route in response.routes{
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true )
            }
        }
    }

    func createDirctionRequest(from coordinate:CLLocationCoordinate2D) -> MKDirections.Request {
        let destenationCoordinate = locationOfTheRestorent!
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destenationCoordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        return request

    }
}

extension MapViewController: CLLocationManagerDelegate{
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
        
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
}
extension MapViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCurrentLocation(mapView: mapView)
        let geoCoder = CLGeocoder()

        guard let _preLocation = preLocation else { return }

        guard center.distance(from: _preLocation) > 50 else { return  }
        preLocation = center

        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarker, error) in
            guard self != nil else {return}
            if let error = error {
                SCLAlertView().showError("Error", subTitle: error.localizedDescription)
            }
            guard let placemarker = placemarker?.first else{
                SCLAlertView().showError("Error !!", subTitle: "")
                return
            }
            print("\(placemarker.subThoroughfare ?? "") \(placemarker.thoroughfare ?? "")")
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .black
        return render
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            let pin = mapView.view(for: annotation) as? MKPinAnnotationView ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            pin.pinTintColor = UIColor.purple
            pin.image = UIImage(named: "location_logo")
            return pin
        }else{
            let identifier = "MyCustomAnnotation"

            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true

                if let annotationView = annotationView {
                    annotationView.image = UIImage(named: "ReLocation")
                }

            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
    }
}
