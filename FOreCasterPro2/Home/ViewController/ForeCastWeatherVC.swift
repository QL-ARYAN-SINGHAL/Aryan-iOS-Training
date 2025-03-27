//
//  ForeCastWeatherVC.swift
//  FOreCasterPro2
//
//  Created by ARYAN SINGHAL on 24/03/25.
//

import UIKit

class ForeCastWeatherVC: UIViewController{
    
    
    //MARK: Properties for ForeCast Weather view controller
    let locationManager = UserLocation()
    
    let forecastFetch = WeatherAPI()
    
    private var forecastData = [ForeCastModal]()
    
    let activityIndicator = UIActivityIndicatorView()
    
    private lazy var foreCastBackgroundImageView: UIImageView = {
        let forecastImageView = UIImageView()
        forecastImageView.image = UIImage(named: ForeCastProStringConstants.currentBackgroundimage)
        forecastImageView.contentMode = .scaleAspectFill
        forecastImageView.clipsToBounds = true
        forecastImageView.translatesAutoresizingMaskIntoConstraints = false
        forecastImageView.alpha = ForeCastProMathConstants.historyAlpha
        return forecastImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.foreCastlabelSize), weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.text = ForeCastProStringConstants.title
        return titleLabel
    }()
    
    private lazy var forecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: "ForecastCell")
        collectionView.register(HeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Forecaster is loaded now ")
        locationManager.delegate = self
        setActivityIndicator()
   
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        locationManager.fetchLocationName()
    }
    
    //MARK: FUNCTIONS
    
    func setActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = .white
        activityIndicator.alpha = 1
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        view.addSubview(activityIndicator)
    }
    
    func updateForeCastData(with newForecastData: ForeCastModal) {
        guard let maxTemperatures = newForecastData.daily?.temperature2MMax else { return }

        let forecastDays = [
            ("24 March", "Monday", "sunny"),
            ("25 March", "Tuesday", "cloudy"),
            ("26 March", "Wednesday", "rainy"),
            ("27 March", "Thursday", "partlycloudy"),
            ("28 March", "Friday", "sunny"),
            ("29 March", "Saturday", "rainy"),
            ("30 March", "Sunday", "sunny")
        ]

        forecastData = forecastDays.enumerated().map { index, day in
            let temperature = index < maxTemperatures.count ? maxTemperatures[index] : nil
            return ForeCastModal(
                latitude: newForecastData.latitude,
                longitude: newForecastData.longitude,
                date: day.0,
                day: day.1,
                weatherType: day.2,
                daily: Daily(temperature2MMax: temperature != nil ? [temperature!] : nil, temperature2MMin: nil)
            )
        }

        DispatchQueue.main.async {
            self.forecastCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            
        }
    }

    
    //MARK: PRIVATE FUNCTIONS 
    
    private func fetchForecast(latitude: Double, longitude: Double) {
        forecastFetch.getForecastWeather(latitude: latitude, longitude: longitude) { [weak self] result in
            switch result {
            case .success(let forecastData):
                DispatchQueue.main.async {
                    self?.updateForeCastData(with: forecastData)
                   
                }
            case .failure(let error):
                print("Error fetching forecast: \(error.localizedDescription)")
            }
        }
    }

    private func setupUI() {
        view.addSubview(foreCastBackgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(forecastCollectionView)
        
        NSLayoutConstraint.activate([
            foreCastBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            foreCastBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foreCastBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foreCastBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            forecastCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            forecastCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues10)),
            forecastCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_10)),
            forecastCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_20))
        ])
        
    }
}

//MARK: EXTENSIONS COLLECTIONVIEW
extension ForeCastWeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
       
        let forecast = forecastData[indexPath.item]
        cell.configure(with: forecast)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionView.identifier, for: indexPath)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

extension ForeCastWeatherVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: CGFloat(ForeCastProMathConstants.collectionlayoutheight))
    }
}

//MARK: Extensions of location delegate
extension ForeCastWeatherVC :  LocationDelegate {
    func didUpdateLocation(latitude: Double, longitude: Double, locationName: String) {
       
        fetchForecast(latitude: latitude, longitude: longitude)
    }
}
