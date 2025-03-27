import UIKit

//MARK: CLASS TO SET THE HEADER SECTION OF FORECAST
class HeaderCollectionView: UICollectionReusableView {
    
    //MARK: PROPERTIES
    
    static let identifier = "header"
    
    private let foreCastText: UILabel = {
        let foreCastLabel = UILabel()
        foreCastLabel.text = ForeCastProStringConstants.headerText
        foreCastLabel.textColor = .white
        foreCastLabel.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.headerlabelSize), weight: .bold)
        foreCastLabel.translatesAutoresizingMaskIntoConstraints = false
        return foreCastLabel
    }()
  
    //MARK: OVERRIDE INITIALISERS
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: PRIVATE FUNCTION SETTING CONSTRAINTS AND VIEW
    private func setupConstraints() {
        addSubview(foreCastText)
       
        
        NSLayoutConstraint.activate([
            foreCastText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues25)),
            foreCastText.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues10)),
            foreCastText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_10)),
            foreCastText.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_10)),
            
            
        ])
    }
}

//MARK: CLASS TO SET THE HEADER SECTION OF THE HISTORY
class HeaderCollectionViewHistory: UICollectionReusableView {
    
    //MARK: PROPERTIES
    static let identifier = "headerHistory"
    
    
    private var historyText: UILabel = {
        let historyLabel = UILabel()
        historyLabel.text = ForeCastProStringConstants.headerTexthistory
        historyLabel.textColor = .white
        historyLabel.font = UIFont.systemFont(ofSize: CGFloat(ForeCastProMathConstants.headerlabelSize), weight: .bold)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.textAlignment = .left
        return historyLabel
    }()
    
    //MARK: OVERRIDE FUNCTIONS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: PRIVATE FUNCTION TO SET THE CONSTRAINS 
    private func setupConstraints() {
       
        addSubview(historyText)
        
        NSLayoutConstraint.activate([
            
            historyText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues25)),
            historyText.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues10)),
            historyText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_10)),
            historyText.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_10)),
        ])
    }
}
