import Foundation

struct WeatherAPI {
    static let apiKey = "c5090c5d610b42ffbcb113559252403"
    
    static let currentBaseURL = "https://api.weatherapi.com/v1/current.json"
    static let forecastBaseURL = "https://api.open-meteo.com/v1/forecast"
    static let historicalBaseURL = "https://archive-api.open-meteo.com/v1/archive"

    enum Endpoint {
        case currentWeather(query: String)
        case forecastWeather(latitude: Double, longitude: Double)
        case historyWeather(latitude: Double, longitude: Double)

        var url: URL? {
            switch self {
            case .currentWeather(let query):
                return URL(string: "\(WeatherAPI.currentBaseURL)?key=\(WeatherAPI.apiKey)&q=\(query)&aqi=no")
                
            case .forecastWeather(let latitude, let longitude):
                return URL(string: "\(WeatherAPI.forecastBaseURL)?latitude=\(latitude)&longitude=\(longitude)&daily=temperature_2m_max,temperature_2m_min&timezone=auto")
                
            case .historyWeather(let latitude, let longitude):
                return URL(string: "\(WeatherAPI.historicalBaseURL)?latitude=\(latitude)&longitude=\(longitude)&start_date=2025-03-15&end_date=2025-03-22&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto")
            }
        }
    }
    
//MARK: GENERIC FUNCTION TO FETCH WEATHER AS PER THE DATA MODAL
//Escaping is used to call a closure after the function it was passed to has returned
    
    static func fetchWeather<T: Codable>(
        for endpoint: Endpoint,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = endpoint.url else {
            completion(.failure(NSError(domain: "WeatherAPIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "WeatherAPIError", code: 2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw API Response successfull")
            }

            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(weatherData))
                }
            } catch {
                print("JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

    // Example usage methods
     func getCurrentWeather(for query: String, completion: @escaping (Result<CurrentWeatherModal, Error>) -> Void) {
         WeatherAPI.fetchWeather(for: .currentWeather(query: query), completion: completion)
    }
    
    func getForecastWeather(latitude: Double, longitude: Double, completion: @escaping (Result<ForeCastModal, Error>) -> Void) {
        WeatherAPI.fetchWeather(for: .forecastWeather(latitude: latitude, longitude: longitude), completion: completion)
    }
    
    func getHistoryWeather(latitude:Double , longitude: Double , completion: @escaping (Result<HistoryModal, Error>) -> Void) {
        WeatherAPI.fetchWeather(for: .historyWeather(latitude: latitude, longitude: longitude), completion: completion)
    }
    
    
    
}
