//
//  ViewController.swift
//  proBazi
//
//  Created by Mehmet Durmaz on 25.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class DetectDevice: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            performSegue(withIdentifier: "toIPhone", sender: self)
            print("iphone")
        case .pad:
            performSegue(withIdentifier: "toIPad", sender: self)
            print("iPad")
        case .unspecified:
            print("bilemedim")
        case .tv:
            print("tv")
        case .carPlay:
            print("carplay")
        }
    }
}

