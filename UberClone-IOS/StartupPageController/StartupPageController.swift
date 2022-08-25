//
//  StartupPageController.swift
//  UberClone-IOS
//
//  Created by Syber Expertise on 03/11/2021.
//

import UIKit

class StartupPageController: UIViewController {
    
    var uberLabel:UILabel!
    var sloganLabel:UILabel!
    var bodyView:UIView!
    var carImageView:UIImageView!
    var startButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 13/256, green: 23/256, blue: 36/256, alpha: 1.0)
        configUI()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    @objc func startButtonPressed(_ sender:UIButton) {
        self.navigationController?.pushViewController(PhoneNumberController(), animated: true)
    }
}
