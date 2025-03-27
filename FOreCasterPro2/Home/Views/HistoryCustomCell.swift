import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: PROPERTIES
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.historylabelSize15), weight: .medium)
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.AnchorValues20), weight: .bold)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.historylabelSize18), weight: .bold)
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.layer.cornerRadius = 12
        return view
    }()
    
    //MARK: OVERRDIE INITIALISERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
        dayLabel.text = nil
        weatherImageView.image = nil
        temperatureLabel.text = nil
    }
    
    //MARK: PRIVATE FUNCTIONS
    private func setupCell() {
        addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(dayLabel)
        containerView.addSubview(weatherImageView)
        containerView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValue4)),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValue4)),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValue_4)),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValue_4)),

            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues16)),
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues20)),

            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues16)),
            dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValue4)),

            weatherImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            weatherImageView.heightAnchor.constraint(equalToConstant: CGFloat(ForeCastProMathConstants.AnchorValue30)),
            weatherImageView.widthAnchor.constraint(equalToConstant: CGFloat(ForeCastProMathConstants.AnchorValue30)),

            temperatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_16)),
            temperatureLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    func configure(with history: HistoryModal) {
        dateLabel.text = history.date
        dayLabel.text = history.day
        temperatureLabel.text = "\(history.daily?.temperature2MMax?.first ?? 0)°C"
        weatherImageView.image = UIImage(named: history.weatherType ?? "questionmark.circle")
    }
    
   
}
