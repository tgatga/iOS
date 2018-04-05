//
//  ThirdViewController.swift
//  MapApp
//
//  Created by Assel Tolebayeva on 27.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(displayP3Red: 164, green: 197, blue: 249, alpha: 1)
        self.view.addSubview(titlee)
        self.view.addSubview(subtitlee)
    }
    func settings(){
        constrain(titlee, subtitlee){titlee,subtitlee in
            titlee.centerX == (titlee.superview?.centerX)!
            titlee.width == (titlee.superview?.width)!/1.2
            titlee.height == 50
            
            subtitlee.centerX == (subtitlee.superview?.centerX)!
            subtitlee.width == titlee.width
            subtitlee.height == titlee.height
        }
    }
    lazy var titlee : UITextField = {
        let t = UITextField()
        t.backgroundColor = UIColor(displayP3Red: 213, green: 222, blue: 237, alpha: 1)
        return t
    }()
    
    lazy var subtitlee : UITextField = {
        let t = UITextField()
         t.backgroundColor = UIColor(displayP3Red: 213, green: 222, blue: 237, alpha: 1)
        return t
    }()


}
