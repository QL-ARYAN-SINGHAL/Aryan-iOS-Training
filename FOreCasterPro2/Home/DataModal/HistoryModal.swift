import Foundation

// MARK: - HistoryModal DATA MODAL
struct HistoryModal: Codable {
    let latitude, longitude: Double?
    
    let date:String?
    let day : String?
    let weatherType: String?
    let daily: Daily?

}

// MARK: - Daily
struct Daily: Codable {
    let temperature2MMax, temperature2MMin: [Double]?

    enum CodingKeys: String, CodingKey {
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}


