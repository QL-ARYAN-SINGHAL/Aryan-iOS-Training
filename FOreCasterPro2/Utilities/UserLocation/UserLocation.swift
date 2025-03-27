import CoreLocation
import UIKit

//MARK: PROTOCOLS


protocol LocationDelegate: AnyObject {
    func didUpdateLocation(latitude: Double, longitude: Double, locationName: String)
}

//MARK: CLASS THAT FETCH USER LOCATION THROUGH CLLOCATIONMANAGER
class UserLocation: NSObject, CLLocationManagerDelegate {
    
    //PROPERTIES
    
   
    private var locationManager = CLLocationManager()
    weak var delegate: LocationDelegate?
    
    //MARK: OVERRIDING INITIALISERS
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
    }
    
//MARK: FUNCTIONS
    func requestLocationAccess() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func startUpdatingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            print("Location services are disabled.")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Location access denied.")
        case .authorizedWhenInUse, .authorizedAlways:
            startUpdatingLocation()
         default:
            print("Unknown authorization status.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        fetchLocationName()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    //MARK: Geocoder is used to get the name of place as per the the coordinates, two types forward and reverse
func fetchLocationName() {
       
        guard let location = locationManager.location else {
            return
        }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error {
                print("Failed to get location name: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found.")
                return
            }
          
            let city = placemark.locality ?? "Unknown"
            
            self?.delegate?.didUpdateLocation(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude,
                locationName: city
            )
            
           
        }
    }
    
}
