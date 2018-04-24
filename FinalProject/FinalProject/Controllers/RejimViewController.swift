//
//  RejimViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class RejimViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    lazy var week : UITextField = {
        let t = UITextField()
        t.placeholder = "Аптасына неше күн"
        t.backgroundColor = .white
        t.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        return t
    }()
    
    lazy var day : UITextField = {
        let t = UITextField()
        t.placeholder = "Күніне неше сағат"
        t.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        t.backgroundColor = .white
        return t
    }()
    lazy var Button : UIButton = {
        let b = UIButton()
        b.setTitle("Режим орнату", for: .normal)
        b.backgroundColor = .blue
        b.layer.cornerRadius = b.frame.height/2
        b.layer.cornerRadius = 18
        b.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        b.titleLabel?.tintColor = .white
//        b.addSubview(self.activity)
//        constrain(self.activity){ activity in
//            activity.center == activity.superview!.center
//        }
//        b.addTarget(self, action: #selector(SignupViewController.buttonSignUp), for: .touchUpInside)
        return b
    }()
    
    func setupViews(){
        self.view.addSubview(week)
        self.view.addSubview(day)
        self.view.addSubview(Button)
        
        week.setBottomBorder()
        day.setBottomBorder()
        
        constrain(week,day,Button) { (week,day,button) in
            week.centerX == (week.superview?.centerX)!
            week.centerY == (week.superview?.centerY)!-150
            week.height == 40
            week.width == (week.superview?.width)!/1.5
            day.centerX == week.centerX
            day.width == week.width
            day.height == week.height
            button.width == day.width
            button.height == day.height
            button.centerX == day.centerX
            distribute(by: 5, vertically: week,day)
            distribute(by: 30, vertically: day,button)
            
            
        }
    }

}
