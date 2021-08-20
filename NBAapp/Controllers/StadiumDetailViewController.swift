//
//  StadiumDetailViewController.swift
//  NBAapp
//
//  Created by Nicholas Gilbert on 8/20/21.
//

import UIKit
import MapKit

class StadiumDetailViewController: UIViewController {
    
    // MARK: internal properties
    var stadium: Stadium?

    @IBOutlet weak var mapView: MKMapView!
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        let capacity = stadium?.capacity ?? 0
        title = "Capacity: \(capacity)"
        
        // print(stadium?.lat)
        // print(stadium?.log)
        
        let lat = stadium?.lat ?? 0
        let lon = stadium?.log ?? 0
        
        let city = stadium?.city ?? ""
        let state = stadium?.state ?? ""
        
        let stadLocation = CLLocation(latitude: lat, longitude: lon)
        mapView.centerToLocation(stadLocation, regionRadius: 350)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        annotation.title = stadium?.name
        annotation.subtitle = city + ", " + state
        mapView.addAnnotation(annotation)
        
    }

}

extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
