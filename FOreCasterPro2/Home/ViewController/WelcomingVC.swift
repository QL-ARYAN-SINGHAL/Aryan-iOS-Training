//
//  WelcomingPage.swift
//  ForecasterPro
//
//  Created by ARYAN SINGHAL on 21/03/25.
//

import UIKit

class WelcomingVC: UIViewController {
    
    private var welcomeBtn: UIButton! = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .black
        btn.setTitle("LET'S GET STARTED", for: .normal)
        btn.setTitleColor(.white, for: .highlighted)
   //     btn.addTarget(WelcomingVC.self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
        
    }()
    
    private var welcomeText: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = "Stay ahead of the weather with Forecaster Pro, the smart and reliable weather app designed to keep you informed at all times."
        label.clipsToBounds = true
        return label
    }()
    
    private var imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "WelcomingImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.9
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(welcomeText)
        view.addSubview(welcomeBtn)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            welcomeBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            welcomeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeBtn.widthAnchor.constraint(equalToConstant: 350),
            welcomeBtn.heightAnchor.constraint(equalToConstant: 80),
            
          
            welcomeText.bottomAnchor.constraint(equalTo: welcomeBtn.topAnchor, constant: -20),
            welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeText.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
        ])
        
        
       

    }
    
    
//    @objc func didTapBtn() {
//
//       let currentWeatherVC = CurrentWeatherVC()
//        self.navigationController?.pushViewController(currentWeatherVC, animated: true)
//    }
    
}


    


