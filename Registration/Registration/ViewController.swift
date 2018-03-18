//
//  ViewController.swift
//  Registration
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ImageView.layer.masksToBounds = true
        self.ImageView.layer.cornerRadius = self.ImageView.frame.size.height / 2
        SignInButton.layer.cornerRadius = 20
        RegistrationButton.layer.cornerRadius = 20
    }
    @IBOutlet weak var ForgotPassword: UILabel!
    @IBOutlet weak var NoRegister: UILabel!
    
    @IBOutlet weak var Login: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var RegistrationButton: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

