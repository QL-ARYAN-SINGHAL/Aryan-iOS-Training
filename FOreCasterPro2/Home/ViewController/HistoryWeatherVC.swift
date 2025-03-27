import UIKit

class HistoryWeatherVC: UIViewController {
    
    //MARK: PROPERTIES
    let historyFetch = WeatherAPI()
    let locationManager = UserLocation()
    let activityIndicator = UIActivityIndicatorView()
    
    private var historyData: [HistoryModal] = []
    
    private lazy var HistoryBackgroundImageView: UIImageView = {
        let historyImageView = UIImageView()
        historyImageView.image = UIImage(named: ForeCastProStringConstants.historyImageName)
        historyImageView.contentMode = .scaleAspectFill
        historyImageView.clipsToBounds = true
        historyImageView.translatesAutoresizingMaskIntoConstraints = false
        historyImageView.alpha = ForeCastProMathConstants.historyAlpha
        return historyImageView
    }()
    
    private lazy var TitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.historyLabelSize), weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.text = ForeCastProStringConstants.title
        return titleLabel
    }()
    
    private lazy var historyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: "HistoryCell")
        collectionView.register(HeaderCollectionViewHistory.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: HeaderCollectionViewHistory.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: LIFECYCEL METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        locationManager.delegate = self
        setActivityIndicator()
        setupConstraints()
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
    
    func updatehistoryData(with historyData: HistoryModal) {
        guard let maxTemperatures = historyData.daily?.temperature2MMax else { return }

        let historyDays = [
            ("24 March", "Monday", "sunny"),
            ("23 March", "Sunday", "cloudy"),
            ("22 March", "Saturday", "rainy"),
            ("21 March", "Friday", "partial clouds"),
            ("19 March", "Thursday", "sunny"),
            ("18 March", "Wednesday", "rainy"),
            ("17 March", "Tuesday", "sunny")
        ]

        var updatedHistoryData: [HistoryModal] = []
        
        for (index, day) in historyDays.enumerated() {
            _ = index < maxTemperatures.count ? "\(maxTemperatures[index])°C" : "--°C"
            
            let history = HistoryModal(
                latitude: historyData.latitude,
                longitude: historyData.longitude,
                date: day.0,
                day: day.1,
                weatherType: day.2,
                daily: Daily(temperature2MMax: [maxTemperatures[index]], temperature2MMin: nil)
            )
            
            updatedHistoryData.append(history)
        }

        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            self.historyData = updatedHistoryData
            self.historyCollectionView.reloadData()
        }
    }
    
    //MARK: PRIVATE FUNCTIONS
    private func fetchHistoryData(latitude:Double , longitude:Double) {
        historyFetch.getHistoryWeather(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let historyData):
                DispatchQueue.main.async {
                    self.updatehistoryData(with: historyData)
                }
            case .failure(let error):
                print("Error fetching history: \(error.localizedDescription)")
            }
        }
    }
   
    private func setupConstraints() {
        view.addSubview(HistoryBackgroundImageView)
        view.addSubview(TitleLabel)
        view.addSubview(historyCollectionView)

        NSLayoutConstraint.activate([
            HistoryBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            HistoryBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            HistoryBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            HistoryBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            TitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            TitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            TitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_20)),

            historyCollectionView.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),
            historyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historyCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: EXTENSIONS

extension HistoryWeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as? HistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let history = historyData[indexPath.item]
        cell.configure(with: history)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionViewHistory.identifier, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width / 6)
    }
}

extension HistoryWeatherVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        return CGSize(width: width, height: CGFloat(ForeCastProMathConstants.collectionlayoutheight))
    }
}

extension HistoryWeatherVC: LocationDelegate {
    func didUpdateLocation(latitude: Double, longitude: Double, locationName: String) {
    
        fetchHistoryData(latitude: latitude, longitude: longitude)
    }
}
