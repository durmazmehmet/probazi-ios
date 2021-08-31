//
//  IPhoneWelcomeVC.swift
//  proBazi
//
//  Created by Mehmet Durmaz on 25.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
}
