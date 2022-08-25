//
//  StartupPageController+UIExtension.swift
//  UberClone-IOS
//
//  Created by Syber Expertise on 03/11/2021.
//

import UIKit

extension StartupPageController{
    
    func configUI() {
        initViews()
        anchorViews()
    }
    
    func initViews() {
        uberLabel = {
           let label = UILabel()
            label.text = "Uber"
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        sloganLabel = {
            let label = UILabel(frame: CGRect(x: 0, y: Int(view.frame.midY), width: 0, height: 50))
             label.text = "Get there."
             label.textColor = .white
             label.font = UIFont.boldSystemFont(ofSize: 18)
             label.translatesAutoresizingMaskIntoConstraints = false
             return label
        }()
        
        bodyView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
            view.backgroundColor = UIColor.init(red: 81/256, green: 75/256, blue: 195/256, alpha: 1.0)
            view.layer.cornerRadius = 20
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        carImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "car-image")
            //view.isHidden = true
            view.alpha = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        startButton = UIButton()
        startButton.mainButtonConfig(withText: "Get Started")
        startButton.alpha = 0
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startButtonPressed(_:)), for: .touchUpInside)
    }
    
    func anchorViews() {
        view.addSubview(bodyView)
        
        let bodyViewHeight = NSLayoutConstraint(item: bodyView!, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.7, constant: 0)
        bodyView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        bodyView.addSubview(uberLabel)
        let uberTopAnchor:NSLayoutConstraint = NSLayoutConstraint(item: uberLabel!, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 10)
        
        let uberCenterYAncor = NSLayoutConstraint(item: uberLabel!, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: -(sloganLabel.frame.height / 3))
        
        uberTopAnchor.isActive = true
        
        uberLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        uberLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bodyView.addSubview(sloganLabel)
        
        let sloganLeadAnchor = NSLayoutConstraint(item: sloganLabel!, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 5)
        
        let sloganCenterYAnchor = NSLayoutConstraint(item: sloganLabel!, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        
        let sloganCenterXAnchor = NSLayoutConstraint(item: sloganLabel!, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        
        sloganLeadAnchor.isActive = true
        sloganCenterYAnchor.isActive = true
        sloganLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bodyView.addSubview(carImageView)
        
        let carImageLeading = NSLayoutConstraint(item: carImageView!, attribute: .leading, relatedBy: .equal, toItem: bodyView, attribute: .centerX, multiplier: 1, constant: 0)
        
        let carImageTrailing = NSLayoutConstraint(item: carImageView!, attribute: .trailing, relatedBy: .equal, toItem: bodyView, attribute: .trailing, multiplier: 1, constant: -25)
        
        carImageTrailing.isActive = true
        carImageLeading.isActive = true
        carImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        view.addSubview(startButton)
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 7)).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 7)).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        UIView.animate(withDuration: 2.5, delay: 0, options: .curveEaseIn, animations: { [self] in
            uberTopAnchor.isActive = false
            uberCenterYAncor.isActive = true
            
            sloganLeadAnchor.isActive = false
            sloganCenterXAnchor.isActive = true
            
            bodyViewHeight.isActive = true
            
            carImageView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.view.layoutIfNeeded()
        }) { _ in
            
            UIView.animate(withDuration: 2, delay: 0, animations: { [self] in
                uberCenterYAncor.isActive = false
                uberTopAnchor.constant = 50
                uberTopAnchor.isActive = true
                uberLabel.transform = CGAffineTransform(scaleX: 2.8, y: 2.4)
                
                
                sloganCenterYAnchor.isActive = false
                self.sloganLabel.topAnchor.constraint(equalTo: self.uberLabel.bottomAnchor, constant: 0).isActive = true
                sloganLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                
                carImageView.isHidden = false
                carImageView.alpha = 1
                carImageTrailing.constant = 50
                carImageTrailing.isActive = true
                carImageLeading.constant = -30
                carImageLeading.isActive = true
                carImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1)
                
                startButton.alpha = 1
                self.view.layoutIfNeeded()
            }) {_ in
                
            }
        }
    }
}
