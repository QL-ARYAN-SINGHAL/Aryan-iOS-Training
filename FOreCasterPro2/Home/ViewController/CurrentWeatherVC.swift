import UIKit
import CoreLocation

class CurrentWeatherVC: UIViewController {
    
    //MARK: - Properties
    let locationManager = UserLocation()
    let forecastFetch = WeatherAPI()
    let currentFetch = WeatherAPI()
    
    //MARK: To add suggestive text in search bar
//    let searchSuggestions = [
//
//        "Mumbai","Delhi","Bangalore","Hyderabad","Chennai","Kolkata","Ahmedabad","Pune","Jaipur","Lucknow","Surat","Kanpur","Nagpur","Indore","Thane","Bhopal","Visakhapatnam","Patna","Vadodara","Ghaziabad","India","United States","United Kingdom","Canada","Australia","Germany","France","Japan","China","Brazil","Russia","Italy","Spain","South Korea","Singapore"
//    ]

    private var weatherData: [[String: String]] = []
    private var filteredWeatherData: [[String: String]] = []
    private var isFiltering = false
    
  
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.text = ForeCastProStringConstants.title
        return label
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ForeCastProStringConstants.currentBackgroundimage)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = ForeCastProMathConstants.alpha
        return imageView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.placeholder = ForeCastProStringConstants.searchBarPlaceholder
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var weatherTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isHidden = true
        tableView.showsVerticalScrollIndicator = false
        tableView.register(WeatherGridCell.self, forCellReuseIdentifier: "WeatherGridCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        setupConstraints()
       
        

    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global().async {
            self.locationManager.requestLocationAccess()
        }
    }
    

    
    // MARK: - Private Methods
    private func fetchWeatherData(for location: String) {
        currentFetch.getCurrentWeather(for: location) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.updateWeatherData(with: weatherData)
                    self.weatherTableView.isHidden = self.searchBar.text?.isEmpty ?? true
                }
            case .failure:
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: ForeCastProStringConstants.alert,
                                                  message: "No location found: \(self.searchBar.text ?? "Unknown")",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: ForeCastProStringConstants.alertActionTitle, style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    


    private func updateWeatherData(with weatherData: CurrentWeatherModal) {
        self.weatherData = [
            [ForeCastProStringConstants.title: ForeCastProStringConstants.name, ForeCastProStringConstants.value: weatherData.location.name ?? "-", "icon": "person"],
            [ForeCastProStringConstants.title: ForeCastProStringConstants.tempInC, ForeCastProStringConstants.value: "\(weatherData.current.tempC ?? 0)°C", ForeCastProStringConstants.icon: "thermometer"],
            [ForeCastProStringConstants.title: ForeCastProStringConstants.humidity, ForeCastProStringConstants.value: "\(weatherData.current.humidity ?? 0)%", ForeCastProStringConstants.icon: "drop"],
            [ForeCastProStringConstants.title : ForeCastProStringConstants.wind, ForeCastProStringConstants.value: "\(weatherData.current.windKph ?? 0) km/h", ForeCastProStringConstants.icon: "wind"],
            [ForeCastProStringConstants.title : ForeCastProStringConstants.condition,  ForeCastProStringConstants.value: weatherData.current.condition?.text ?? "-", ForeCastProStringConstants.icon: "sun.max"],
            [ForeCastProStringConstants.title: ForeCastProStringConstants.feelsLike, ForeCastProStringConstants.value: "\(weatherData.current.tempF ?? 0)°F", ForeCastProStringConstants.icon: "sun.fill"]
        ]
        filteredWeatherData = self.weatherData
        weatherTableView.reloadData()
    }
    
    private func setupConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerLabel)
        view.addSubview(searchBar)
        view.addSubview(weatherTableView)
       
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchBar.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues16)),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_16)),
            
            weatherTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_16)),
            weatherTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_20))
        ])
    }
}

//MARK: - Table View Delegates
extension CurrentWeatherVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isFiltering ? filteredWeatherData.count : weatherData.count) / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherGridCell", for: indexPath) as? WeatherGridCell else {
            return UITableViewCell()
        }
        
        let data = isFiltering ? filteredWeatherData : weatherData
        let leftIndex = indexPath.row * 2
        let rightIndex = leftIndex + 1
        
        let leftItem = data[leftIndex]
        let rightItem = rightIndex < data.count ? data[rightIndex] : [ForeCastProStringConstants.title: "", ForeCastProStringConstants.value: "", ForeCastProStringConstants.icon: ""]
        
        cell.configure(leftItem: leftItem, rightItem: rightItem)
        return cell
    }
}

//MARK: -  Lcoations Handling
extension CurrentWeatherVC : LocationDelegate {
    func didUpdateLocation(latitude: Double, longitude: Double, locationName: String) {
        DispatchQueue.main.async {
            self.searchBar.text = locationName
            self.fetchWeatherData(for: locationName)
        }
    }
}

//MARK: - SearchBar delegates 
extension CurrentWeatherVC : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchTerm = searchBar.text, !searchTerm.isEmpty {
           
            fetchWeatherData(for: searchTerm)
           
            weatherTableView.reloadData()
        }
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isFiltering = false
        filteredWeatherData = weatherData
       
        weatherTableView.reloadData()
       
    }
}
