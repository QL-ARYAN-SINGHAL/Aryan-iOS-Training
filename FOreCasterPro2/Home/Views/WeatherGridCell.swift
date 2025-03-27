//
//  WeatherGridTableViewTableViewCell.swift
//  FOreCasterPro2
//
//  Created by ARYAN SINGHAL on 21/03/25.
//

import UIKit

class WeatherGridCell: UITableViewCell {
    
    //MARK: PROPERTIES OF CURRENT WEATHER GRID
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var leftGridItem: WeatherGridItemView = {
        let view = WeatherGridItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var rightGridItem: WeatherGridItemView = {
        let view = WeatherGridItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//MARK: OVERRIDING INITIALISERS
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: FUNCTION TO SET THE CONSTRAINTS
    func setupCell() {
        backgroundColor = .clear
        selectionStyle = .none
        
        containerStackView.addArrangedSubview(leftGridItem)
        containerStackView.addArrangedSubview(rightGridItem)
        
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues5)),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(ForeCastProMathConstants.AnchorValues_5))
        ])
    }
    
    func configure(leftItem: [String: String], rightItem: [String: String]) {
        leftGridItem.configure(with: leftItem)
        rightGridItem.configure(with: rightItem)
    }
}
