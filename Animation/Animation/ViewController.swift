//
//  ViewController.swift
//  Animation
//
//  Created by Assel Tolebayeva on 29.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 206/255, green: 174/255, blue: 152/255, alpha: 1)
        addView()
        setupView()
    }
    
    func setupView(){
        constrain(email,password,button){e,p,b in
            e.width == (e.superview?.width)!/1.5
            e.height == 40
            e.centerX == (e.superview?.centerX)!
            e.top == (e.superview?.centerY)! - 90
            p.width == e.width
            p.height == e.height
            p.centerX == e.centerX
            p.centerY == e.bottom + 40
            b.centerX == (b.superview?.centerX)!
            b.top == p.bottom + 40
            b.height == 50
            b.width == 100
        }
    }
    
    func addView(){
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(button)
    }
    
    lazy var email : UITextField = {
        let e = UITextField()
        e.backgroundColor = .white
        e.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        e.layer.cornerRadius = 10
        e.placeholder = "Email"
        let transition1: CATransition = CATransition()
        let timeFunc1 : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition1.duration = 1
        transition1.timingFunction = timeFunc1
        transition1.type = kCATransitionPush
        transition1.subtype = kCATransitionFromRight
        e.layer.add(transition1, forKey: kCATransition)
        return e
    }()
    
    lazy var password : UITextField = {
        let p = UITextField()
        p.backgroundColor = .white
        p.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        p.layer.cornerRadius = 10
        p.placeholder = "Password"
        let transition1: CATransition = CATransition()
        let timeFunc1 : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition1.duration = 1
        transition1.timingFunction = timeFunc1
        transition1.type = kCATransitionPush
        transition1.subtype = kCATransitionFromLeft
        p.layer.add(transition1, forKey: kCATransition)
        return p
    }()
    
    lazy var button : UIButton = {
        let b = UIButton()
        b.setTitle("Next", for: .normal)
        b.layer.borderWidth = 2
        b.layer.borderColor = UIColor.white.cgColor;
        b.alpha = 0
        b.layer.cornerRadius = 10
        UIView.animate(withDuration: 2, animations: {
           b.alpha = 1.0
        })
        //                b.transform = CGAffineTransform(scaleX: -1, y: 1)
        //                UIView.animate(withDuration: 2, animations: { () -> Void in
        //                    b.transform = CGAffineTransform(scaleX: 1,y: 1)
        //                })
        b.addTarget(self, action: #selector(ViewController.pushView), for: .touchUpInside)
        return b
    }()

    let viewT = TableViewController()
    @objc func pushView(){
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            
            self.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            
        }) { (success) in
            self.present(self.viewT, animated: false, completion:nil)
        }
        print("pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

