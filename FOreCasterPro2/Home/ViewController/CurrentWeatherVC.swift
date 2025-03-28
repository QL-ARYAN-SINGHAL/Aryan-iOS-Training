import UIKit
import CoreLocation

class CurrentWeatherVC: UIViewController {
    
    //MARK: Suggestion for dropdown search
    let citySuggestions = [
        "Mumbai", "Delhi", "Bangalore", "Hyderabad", "Chennai",
        "Kolkata", "Pune", "Ahmedabad", "Jaipur", "Lucknow",
        "United States", "United Kingdom", "Canada", "Australia", "Germany",
        "France", "Japan", "China", "Brazil", "Russia"
    ]

    // MARK: - Properties
    private let locationManager = UserLocation()
    private let weatherAPI = WeatherAPI()
    private let foreCastVC = ForeCastWeatherVC()
    
    private var weatherData: [[String: String]] = []
    private var filteredWeatherData: [[String: String]] = []
    private var isFiltering = false
    private var suggestedCities: [String] = []
    
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
    
    private lazy var dropDownView: UIStackView = {
        let stackView = UIStackView()
        let layout = UIScrollView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .darkGray
        layout.showsVerticalScrollIndicator = true
        stackView.layer.cornerRadius = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isHidden = true
        return stackView
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
    
    // MARK: - Lifecycle
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
        weatherAPI.getCurrentWeather(for: location) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.updateWeatherData(with: weatherData)
//                    self.dropDownView.isHidden = true
                    self.weatherTableView.isHidden = self.searchBar.text?.isEmpty ?? true
                    
                }
            case .failure:
                print("Failed to update weather data through search")
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
    
    func updateDropDown(with searchText: String) {
        dropDownView.subviews.forEach { $0.removeFromSuperview() }

        suggestedCities = searchText.isEmpty ? [] : citySuggestions
            .filter { $0.lowercased().contains(searchText.lowercased()) }
  

        if suggestedCities.isEmpty {
            dropDownView.isHidden = true
            return
        }

        dropDownView.isHidden = false

        for city in suggestedCities {
            let cityName = UILabel()
            cityName.text = city
            cityName.isUserInteractionEnabled = true
            cityName.textAlignment = .left
            cityName.backgroundColor = .darkGray
            cityName.textColor = .white
            cityName.layer.cornerRadius = 5
            cityName.font = UIFont(name: "Poppins", size: 15)
            cityName.clipsToBounds = true
            cityName.translatesAutoresizingMaskIntoConstraints = false

            let cityView = UIView()
            cityView.backgroundColor = .darkGray
            cityView.layer.cornerRadius = 5
            cityView.translatesAutoresizingMaskIntoConstraints = false
            cityView.addSubview(cityName)

            dropDownView.addArrangedSubview(cityView)

            NSLayoutConstraint.activate([
                cityName.leadingAnchor.constraint(equalTo: cityView.leadingAnchor, constant: 10),
                cityName.trailingAnchor.constraint(equalTo: cityView.trailingAnchor, constant: -10),
                cityName.topAnchor.constraint(equalTo: cityView.topAnchor, constant: 5),
                cityName.bottomAnchor.constraint(equalTo: cityView.bottomAnchor, constant: -5),
                cityView.heightAnchor.constraint(equalToConstant: 40),
                cityView.trailingAnchor.constraint(equalTo: cityView.trailingAnchor,constant: -20)
            ])

            cityName.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(suggestionTapped(_:))))
        }
    }


    @objc private func suggestionTapped(_ sender: UITapGestureRecognizer) {
        if let label = sender.view as? UILabel, let cityName = label.text {
            searchBar.text = cityName
            dropDownView.isHidden = true
          
            fetchWeatherData(for: cityName)
            searchBarSearchButtonClicked(searchBar)
        }
    }

    private func setupConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerLabel)
        view.addSubview(searchBar)
        view.addSubview(dropDownView)
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
                    
                    dropDownView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
                    dropDownView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
                    dropDownView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor,constant: -20),

                   
                  
                    
                    weatherTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
                    weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
                    weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_16)),
                    weatherTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_20))
                ])
        self.view.bringSubviewToFront(dropDownView)
    }
}

// MARK: - SearchBar Delegate
extension CurrentWeatherVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateDropDown(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
            self.fetchWeatherData(for: searchTerm)
        dropDownView.isHidden = true
        if let searchText = searchBar.text, !searchText.isEmpty {
            fetchWeatherData(for: searchText)
        }

        }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isFiltering = false
        filteredWeatherData = weatherData
        weatherTableView.reloadData()
    }
    
}
extension CurrentWeatherVC: UITableViewDelegate, UITableViewDataSource {
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

// MARK: - Location Handling
extension CurrentWeatherVC: LocationDelegate {
    func didUpdateLocation(latitude: Double, longitude: Double, locationName: String) {
        DispatchQueue.main.async {
            self.searchBar.text = locationName
            self.fetchWeatherData(for: locationName)
        }
    }
}


 

