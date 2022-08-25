//
//  PhoneNumberController.swift
//  UberClone-IOS
//
//  Created by Syber Expertise on 03/11/2021.
//

import UIKit

class PhoneNumberController:UIViewController {
    
    var enterPhoneNumberLabel:UILabel!
    
    var countryCodeTextField:UITextField!
    var phoneNumberTextField:UITextField!
    var confirmPrivacyLabel:UILabel!
    var acceptButton:UIButton!
    
    var phoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 13/256, green: 23/256, blue: 36/256, alpha: 1.0)
        configUI()
    }
    
    @objc func textFieldDidBegin(_ sender:UITextField) {
        
        phoneNumber = sender.text ?? ""
        //print("A :: \(phoneNumber)")
        if phoneNumber.count == 10 {
            //sender.resignFirstResponder()
        }
    }
    
    @objc func textFieldIsChanging(_ sender:UITextField) {
        
        if sender.text!.count >= 11 {
            sender.text = phoneNumber
            sender.resignFirstResponder()
            
        } else {
            phoneNumber = sender.text!
            //print("B :: \(phoneNumber)")
        }
        
        if sender.text?.count == 10 {
            UIView.animate(withDuration: 2, animations: {
                self.acceptButton.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 2, animations: {
                self.acceptButton.alpha = 0
            })
        }
    }
    
    @objc func acceptButtonPressed(_ sender:UIButton) {
        print("Pressed")
    }
}
