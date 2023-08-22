import Foundation
import MapKit

class CustomMKAnnotationView: MKAnnotationView {
    
    // MARK: - Internal Properties
    override var annotation: MKAnnotation? {
        willSet {
            guard let customAnnotation = newValue as? CustomAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: 5, y: 5)
            let mapsButton = UIButton(frame: CGRect(
                origin: CGPoint.zero,
                size: CGSize(width: 48, height: 48)))
            mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Map"), for: .normal)
            rightCalloutAccessoryView = mapsButton
            image = UIImage(named: "BrainX")
        }
    }
}

