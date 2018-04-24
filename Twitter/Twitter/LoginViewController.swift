//
//  LoginViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseAuth

class LoginViewController: UIViewController {
    private var count = 0
    let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        setupViews()
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "twitter-1.png")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
    }
    lazy var email_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Эл. почта"
        f.backgroundColor = .white
        f.setBottomBorder()
        f.font = UIFont(name: "Helvetica", size: 14)
        f.tintColor = twitterColor
        f.textColor = twitterColor
        return f
    }()
    lazy var password_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Пароль"
        f.isSecureTextEntry = true
        f.backgroundColor = .white
        f.font = UIFont(name: "Helvetica", size: 14)
        f.tintColor = twitterColor
        f.textColor = twitterColor
        f.setBottomBorder()
        return f
    }()
    lazy var message : UILabel = {
        let l = UILabel()
       // l.text = "We have sent you a message. Check your email"
        l.font = UIFont.systemFont(ofSize: 10)
        l.textAlignment = .center
        return l
    }()
    lazy var loginnButton : UIButton = {
        let b = UIButton()
        b.setTitle("Log in", for: .normal)
        b.layer.cornerRadius = 18
        b.backgroundColor = twitterColor
        b.addTarget(self, action: #selector(LoginViewController.signinButton), for: .touchUpInside)
        return b
    }()

    @objc func signinButton(){
        if(email_field.text != ""){
            if(password_field.text != ""){
                Auth.auth().signIn(withEmail: email_field.text!, password: password_field.text!) { user, error in
                    if error == nil && user != nil {
                        let nav = UINavigationController()
                        nav.viewControllers = [BaseViewController()]
                        self.present(nav, animated: false, completion: nil)
                    } else {
                        self.message.textColor = .red
                        self.message.text = "Error logging in: \(error!.localizedDescription)"
                    }
                }
            }
            else{
                self.password_field.setBottomBorderRed()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.password_field.setBottomBorder()
                }
            }
        }
        else{
            if(password_field.text != ""){
                self.email_field.setBottomBorderRed()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.email_field.setBottomBorder()
                }
            }
            else{
                self.email_field.setBottomBorderRed()
                self.password_field.setBottomBorderRed()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.email_field.setBottomBorder()
                    self.password_field.setBottomBorder()
                }
            }
        }
    }
    
    func setupViews(){
        view.addSubview(email_field)
        view.addSubview(password_field)
        view.addSubview(loginnButton)
        view.addSubview(message)
        constrain(email_field,password_field,loginnButton,message){ email,password,loginn,message in
            email.width == email.superview!.width/1.4
            email.centerX == email.superview!.centerX
            email.top == email.superview!.top + self.view.bounds.width/2
            email.height == email.superview!.width/10
            
            password.width == email.width
            password.centerX == email.centerX
            password.height == email.height
            
            message.width == message.superview!.width
            message.height == email.height/2
            message.centerX == message.superview!.centerX
            
            loginn.width == email.width
            loginn.height == email.height
            loginn.centerX == email.centerX
            
            distribute(by: 10, vertically: email,password,loginn)
            distribute(by: 1, vertically: password,message)
        }
    }
}
