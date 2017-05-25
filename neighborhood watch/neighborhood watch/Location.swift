import Foundationimport MapKitimport Contactsimport AddressBookclass Location: NSObject, MKAnnotation {    var title: String?    let locationName: String    let discipline: String    let coordinate: CLLocationCoordinate2D    var pinKey: String?        init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, pinKey: String) {        self.title = title        self.locationName = locationName        self.discipline = discipline        self.coordinate = coordinate        self.pinKey = pinKey                super.init()    }        var subtitle: String? {        return locationName    }        var image: UIImage {    switch discipline {        case "Sanitation":            return UIImage(named: "poop_emoji")!        case "Blocked Roads":            return UIImage(named: "road_block")!        case "Infrastructure":            return UIImage(named: "infrastructure_cone")!        case "Suspicious Activity":            return UIImage(named: "caution")!        case "Crowd":            return UIImage(named: "crowd")!        default:        print("nothing")            return UIImage()    }    }        func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!,                 calloutAccessoryControlTapped control: UIControl!) {        let location = view.annotation as! Location        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]        location.mapItem().openInMaps(launchOptions: launchOptions)    }            func mapItem() -> MKMapItem {        let addressDict = [CNPostalAddressStreetKey: subtitle!]        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)            let mapItem = MKMapItem(placemark: placemark)        mapItem.name = title            return mapItem    }    }