import Foundation




//MARK: DATA MODEL FOR CURRENT WEATHER

struct CurrentWeatherModal: Codable {
      let location: Location
      let current: Current
      
      struct Location: Codable {
          let name: String?
          let lat: Double?
          let lon: Double?
         
      }
  }
struct Current: Codable {
    let tempC: Double?
    let condition: Condition?
    let windKph: Double?
    let humidity: Int?
    let feelsLikeC: Double?
    let tempF : Double?
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
        case feelsLikeC = "feelslike_c"
        case tempF = "temp_f"
      
    }
    
    struct Condition: Codable {
        let text: String?
        let icon: String?
    }
}

