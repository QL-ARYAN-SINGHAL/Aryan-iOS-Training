
//MARK: DATA MODAL FOR FORECAST
import Foundation


struct ForeCastModal: Codable {
    let latitude, longitude: Double?
    let date:String?
    let day:String?
    let weatherType:String?
    let daily: Daily?
}





