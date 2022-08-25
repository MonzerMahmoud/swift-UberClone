//
//  Extensions.swift
//  UberClone-IOS
//
//  Created by Syber Expertise on 03/11/2021.
//

import UIKit

extension UIButton {
    
    func mainButtonConfig(withText text: String) {
        self.backgroundColor = UIColor.init(red: 81/256, green: 75/256, blue: 195/256, alpha: 1.0)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 10
    }
}

extension UITextField {
    
    func mainTextField(withPlaceholder placeholder:String) {
        self.backgroundColor = .clear
        self.placeholder = placeholder
        //self.addBottomBorder()
        self.textColor = .white
        self.layer.borderColor = UIColor.white.cgColor
        //borderStyle = .roundedRect
        //layer.borderWidth = 0.8
    }
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 2, width: self.frame.size.width, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor
        borderStyle = .roundedRect
        layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
    }
    
    
}

