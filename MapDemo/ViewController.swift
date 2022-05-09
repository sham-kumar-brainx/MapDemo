import MapKit
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 5.0) {
                let initialLocation = CLLocation(latitude: 31.4689, longitude: 74.2701)
                let region = MKCoordinateRegion( center: initialLocation.coordinate, latitudinalMeters: CLLocationDistance(exactly: 1000)!, longitudinalMeters: CLLocationDistance(exactly: 1000)!)
                self.mapView.setRegion(self.mapView.regionThatFits(region), animated: true)
            }
        }
        mapView.delegate = self
        mapView.register(CustomMKAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier:
                            MKMapViewDefaultAnnotationViewReuseIdentifier)
        let customAnnotation = CustomAnnotation(
            title: "BrainX Technologies",
            locationName: "Khokar Chok, Johar Town",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 31.4689, longitude: 74.2701))
        mapView.addAnnotation(customAnnotation)
        
    }
}

// MARK: - Extention for confroming MKMapViewDelegate
extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    // MARK: - Internal Methods
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl
    ) {
        guard let customAnnotation = view.annotation as? CustomAnnotation else { return }
        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
        ]
        customAnnotation.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}
