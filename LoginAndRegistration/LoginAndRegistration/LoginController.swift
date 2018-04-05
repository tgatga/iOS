//
//  ViewController.swift
//  LoginAndRegistration
//
//  Created by Assel Tolebayeva on 21.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
@IBDesignable
class LoginController: UIViewController {
//
//    @IBOutlet weak var ImageView: UIImageView!
//    @IBOutlet weak var lblLogin: UILabel!
//    @IBOutlet weak var LoginTextField: UITextField!
//    @IBOutlet weak var ForgotPassword: UILabel!
//    @IBOutlet weak var PasswordTextField: UITextField!
//
//    @IBOutlet weak var LoginButton: UIButton!
//    @IBOutlet weak var RegistrationLabel: UILabel!
//    @IBOutlet weak var RegistrationButton: UIButton!
//
//
    
    var loginView: LoginView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.loginView.loginAction = loginPressed
        self.loginView.regAction = regPressed
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func loginPressed(){
        print("log")
    }
    func regPressed(){
        print("reg")
    }
}

