//
//  PhoneNumberController+UIExtension.swift
//  UberClone-IOS
//
//  Created by Syber Expertise on 03/11/2021.
//

import UIKit

extension PhoneNumberController{
    
    func configUI() {
        initViews()
        anchorViews()
    }
    
    func initViews() {
        enterPhoneNumberLabel = {
            let label = UILabel(frame: CGRect(x: view.frame.maxX, y: 0, width: 0, height: 0))
            label.text = "Enter your phone number"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        countryCodeTextField = UITextField(frame: CGRect(x: view.frame.maxX, y: 0, width: 0, height: 0))
        countryCodeTextField.mainTextField(withPlaceholder: "+249")
        countryCodeTextField.text = "+249"
        //countryCodeTextField.addBottomBorder()
        countryCodeTextField.isUserInteractionEnabled = false
        countryCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberTextField = UITextField(frame: CGRect(x: view.frame.maxX, y: 0, width: 0, height: 0))
        phoneNumberTextField.mainTextField(withPlaceholder: "0123456789")
        phoneNumberTextField.keyboardType = .phonePad
        
        //phoneNumberTextField.text = "0123456789"
        //phoneNumberTextField.addBottomBorder()
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidBegin(_:)), for: .editingDidBegin)
        phoneNumberTextField.addTarget(self, action: #selector(textFieldIsChanging(_:)), for: .editingChanged)
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        confirmPrivacyLabel = {
           let label = UILabel()
            label.text = "By countinuing, I confirm I have read the  Privacy Policy"
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        acceptButton = UIButton()
        acceptButton.mainButtonConfig(withText: "Accept & Continue")
        acceptButton.alpha = 0
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    func anchorViews() {
        
        view.addSubview(enterPhoneNumberLabel)
        let phoneLabelLeading = NSLayoutConstraint(item: enterPhoneNumberLabel!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 25)
        
        enterPhoneNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        enterPhoneNumberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
        view.addSubview(countryCodeTextField)
        countryCodeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        countryCodeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        //countryCodeTextField.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.leadingAnchor.constraint(equalTo: countryCodeTextField.trailingAnchor, constant: 10).isActive = true
        phoneNumberTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        //phoneNumberTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
        view.addSubview(confirmPrivacyLabel)
        confirmPrivacyLabel.topAnchor.constraint(equalTo: countryCodeTextField.bottomAnchor, constant: 5).isActive = true
        confirmPrivacyLabel.leadingAnchor.constraint(equalTo: countryCodeTextField.leadingAnchor).isActive = true
        confirmPrivacyLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25).isActive = true
        
        
        view.addSubview(acceptButton)
        acceptButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 7)).isActive = true
        acceptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 7)).isActive = true
        acceptButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        acceptButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        UIView.animate(withDuration: 2, animations: {
            phoneLabelLeading.isActive = true
            //self.view.layoutIfNeeded()
        }, completion: {_ in

        })
    }
}
