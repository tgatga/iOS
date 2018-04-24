//
//  ViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 11.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupViews()
        
        let current_user = Auth.auth().currentUser
        if current_user != nil{
            let nav = UINavigationController()
            nav.viewControllers = [BaseViewController()]
            self.present(nav, animated: false, completion: nil)
        }
        
    }
    lazy var iconImage : UIImageView = {
        let i = UIImageView()
        i.image = #imageLiteral(resourceName: "twitter-1")
        return i
    }()
    lazy var label : UILabel = {
        let l = UILabel()
        l.text = "Узнайте, что происходит в мире прямо сейчас."
        l.font = UIFont(name:"HelveticaNeue-Bold", size: 26.0)
        l.textColor = .black
        l.numberOfLines = 4
        return l
    }()
    lazy var loginlabel : UILabel = {
        let l = UILabel()
        l.text = "Уже есть учетная запись?"
        l.font = UIFont(name:"Avenir-Light", size: 13.0)
        l.textColor = .gray
        return l
    }()
    lazy var signupButton : UIButton = {
        let b = UIButton()
        b.setTitle("Начать", for: .normal)
        b.backgroundColor = twitterColor
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 18
        b.addTarget(self, action: #selector(signupbuttonAction), for: .touchUpInside)
        return b
    }()
    lazy var loginButton : UIButton = {
        let b = UIButton()
        b.setTitle("Войти", for: .normal)
        b.titleLabel?.font = UIFont(name:"Avenir-Light", size: 13.0)!
        b.setTitleColor(twitterColor, for: .normal)
        b.addTarget(self, action: #selector(loginbuttonAction), for: .touchUpInside)
        return b
    }()
    @objc func loginbuttonAction(sender: UIButton!) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    @objc func signupbuttonAction(sender: UIButton!) {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(signupButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(iconImage)
        self.view.addSubview(loginlabel)
        self.view.addSubview(label)
        
        constrain(iconImage,label,signupButton,loginlabel,loginButton) { (i,lbl,b,ll,l) in
            i.top == (i.superview?.top)!+40
            i.left == (i.superview?.left)!+40
            i.width == 40
            i.height == 40
            
            lbl.centerY == (lbl.superview?.centerY)!-30
            lbl.centerX == (lbl.superview?.centerX)!-20
            lbl.width == (lbl.superview?.width)!-140
            lbl.height == 200
            
            ll.bottom == (ll.superview?.bottom)!-50
            ll.left == (ll.superview?.left)!+40
            ll.height == 20
            ll.width == 160
            
            b.top == lbl.bottom
            b.centerX == (b.superview?.centerX)!
            b.width == (b.superview?.width)!-100
            b.height == 36
            
            l.left == ll.right
            l.bottom == ll.bottom
            l.height == 20
            l.width == 40
        }
    }
}

