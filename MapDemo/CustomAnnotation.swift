import Contacts
import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    // MARK: - Internal Properties
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    // MARK: - Internal Computed Properties
    var subtitle: String? {
        return locationName
    }
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(
            coordinate: coordinate,
            addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    // MARK: - Initailizer Methods
    init(title: String?,
         locationName: String?,
         discipline: String?,
         coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
}
