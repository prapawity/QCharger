//
//  MapViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation)
        bottomView.addShadow()
    }
    
    @IBAction func didTapToPayment(_ sender: Any) {
        guard let paymentView = ViewControllerFactory.PaymentViewController() else { return }
        paymentView.isShowTransactionView = true
        present(paymentView, animated: true, completion: nil)
    }
    
}

private extension MKMapView {
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
