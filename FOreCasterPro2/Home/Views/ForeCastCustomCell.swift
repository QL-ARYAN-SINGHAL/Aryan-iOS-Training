import Foundation
import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    //MARK: PROPERTIES OF CELL
    
    private let dateLabel: UILabel = {
        let datelabel = UILabel()
        datelabel.translatesAutoresizingMaskIntoConstraints = false
        datelabel.textColor = .white
        datelabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        return datelabel
    }()
    
    private let dayLabel: UILabel = {
        let daylabel = UILabel()
        daylabel.translatesAutoresizingMaskIntoConstraints = false
        daylabel.textColor = .white
        daylabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        daylabel.numberOfLines = 0
        return daylabel
    }()
    
    private let weatherImageView: UIImageView = {
        let weatherimageView = UIImageView()
        weatherimageView.translatesAutoresizingMaskIntoConstraints = false
        weatherimageView.contentMode = .scaleAspectFit
        return weatherimageView
    }()
    
    private let temperatureLabel: UILabel = {
        let temperaturelabel = UILabel()
        temperaturelabel.translatesAutoresizingMaskIntoConstraints = false
        temperaturelabel.textColor = .white
        temperaturelabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return temperaturelabel
    }()
    
    private let containerView: UIView = {
        let tableContainerView = UIView()
        tableContainerView.translatesAutoresizingMaskIntoConstraints = false
        tableContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        tableContainerView.layer.cornerRadius = 12
        return tableContainerView
    }()
    
    //MARK: OVERRIDE FUNCTIONS AND INITIALISERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
        weatherImageView.image = nil
        temperatureLabel.text = nil
        dayLabel.text = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: PRIVATE FUNCTIONS TO SET CONSTRAINTS
    private func setupCell() {
        addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(dayLabel)
        containerView.addSubview(weatherImageView)
        containerView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
           
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.33),
            
           
            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            dayLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.33),
            
            
            weatherImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            weatherImageView.heightAnchor.constraint(equalToConstant: 30),
            weatherImageView.widthAnchor.constraint(equalToConstant: 30),
            
           
            temperatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            temperatureLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
        
    func configure(with forecast: ForeCastModal) {
        dateLabel.text = forecast.date
        
        switch forecast.weatherType {
        case "sunny":
            weatherImageView.image = UIImage(named: "sunny")
            weatherImageView.tintColor = .yellow
        case "cloudy":
            weatherImageView.image = UIImage(named: "cloudy")
            weatherImageView.tintColor = .white
        case "rainy":
            weatherImageView.image = UIImage(named: "rainy")
            weatherImageView.tintColor = .systemBlue
        case "partlycloudy":
            weatherImageView.image = UIImage(named: "partial clouds")
            weatherImageView.tintColor = .lightGray
        default:
            weatherImageView.image = UIImage(systemName: "questionmark.circle")
            weatherImageView.tintColor = .white
        }
        
        temperatureLabel.text = "\(forecast.daily?.temperature2MMax?.first ?? 0)°C"
        dayLabel.text = forecast.day
    }

    
 
}
