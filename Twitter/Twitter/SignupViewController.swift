//
//  SignInViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 12.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import  Cartography
import AAPickerView

class SignupViewController: UIViewController {
    private var count = 0
    let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    
    lazy var name_field : UITextField = {
        let n = UITextField()
        n.placeholder = "Имя"
        n.tintColor = twitterColor
        n.textColor = twitterColor
        n.font = UIFont(name: "Helvetica", size: 14)
        //n.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        n.backgroundColor = .white
        n.setBottomBorder()
        n.becomeFirstResponder()
        return n
    }()
    lazy var surname_field : UITextField = {
        let n = UITextField()
        n.placeholder = "Фамилия"
        n.backgroundColor = .white
        n.font = UIFont(name: "Helvetica", size: 14)
        n.tintColor = twitterColor
        n.textColor = twitterColor
        n.setBottomBorder()
        return n
    }()

    lazy var bday_field:AAPickerView = {
        let p = AAPickerView()
        p.pickerType = .DatePicker
        p.placeholder = "Дата рождения"
        p.datePicker?.datePickerMode = .date
        p.dateFormatter.dateFormat = "dd/MM/yyyy"
        p.rightViewMode = .always
        p.tintColor = twitterColor
        p.textColor = twitterColor
        p.backgroundColor = .white
        p.setBottomBorder()
        p.font = UIFont(name: "Helvetica", size: 14)
        return p
    }()
    lazy var email_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Эл. почта"
        f.backgroundColor = .white
        f.setBottomBorder()
        f.keyboardType = .emailAddress
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
        f.resignFirstResponder()
        return f
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    lazy var activity:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.hidesWhenStopped = true
        return activity
    }()
    
    lazy var signupButton : UIButton = {
        let b = UIButton()
        b.setTitle("Зарегистрироваться", for: .normal)
        b.backgroundColor = twitterColor
        b.layer.cornerRadius = 18
        b.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        b.titleLabel?.tintColor = twitterColor
        b.addSubview(self.activity)
        constrain(self.activity){ activity in
            activity.center == activity.superview!.center
        }
        b.addTarget(self, action: #selector(SignupViewController.buttonSignUp), for: .touchUpInside)
        return b
    }()
    lazy var messageLabel : UILabel = {
        let l = UILabel()
        //l.text = ""
        l.font = UIFont.systemFont(ofSize: 12)
        l.textAlignment = .center
        return l
    }()
    
    @objc func buttonSignUp(){
        self.signupButton.setTitle("", for: .normal)
        self.activity.startAnimating()
        if(check()){
            Auth.auth().createUser(withEmail: email_field.text!, password: password_field.text!) { user, error in
                    self.activity.stopAnimating()
                    self.signupButton.setTitle("Зарегистрироваться", for: UIControlState.normal)
                    if error == nil && user != nil {
                        print("User created!")
                        self.messageLabel.text = "success"
                        self.messageLabel.textColor = .green
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        //changeRequest?.displayName = "\(self.name_field.text!)%%%\(self.surname_field.text!)%%%\(self.bday_field.text!)"
                        changeRequest?.displayName = "\(self.name_field.text!)%%%\(self.surname_field.text!)%%%\(self.bday_field.text!)"
                        changeRequest?.commitChanges { error in
                            if error == nil {
//                                                user?.sendEmailVerification(completion: { (error) in
//                                                    if error == nil{
//                                                        self.messageLabel.text = "Check your email.We sent you a verification link"
//                                                        self.messageLabel.textColor = UIColor.green
//                                                    }
//                                                })
                                self.dismiss(animated: false, completion: nil)
                            } else {
                                self.messageLabel.textColor = .red
                                self.messageLabel.text = "Error: \(error!.localizedDescription)"
                            }
                        }
                    } else {
                        self.messageLabel.textColor = .red
                        self.messageLabel.text = "Error: \(error!.localizedDescription)"
                    }
                }
            }
        else{
            self.activity.stopAnimating()
        }
        signupButton.setTitle("Зарегистрироваться", for: .normal)
        count = 0
    }
    
    func check() -> Bool {
        TextFields(name_field)
        TextFields(surname_field)
        TextFields(bday_field)
        TextFields(email_field)
        TextFields(password_field)
        if(count != 0){return false}
        else{return true}
    }
    
    func setupViews(){
        view.addSubview(name_field)
        view.addSubview(surname_field)
        view.addSubview(bday_field)
        view.addSubview(email_field)
        view.addSubview(password_field)
        view.addSubview(signupButton)
        view.addSubview(messageLabel)

        constrain(name_field,surname_field,bday_field, email_field,password_field,signupButton,messageLabel){ n,s,d,e,p,b,m in
            n.centerX == (n.superview?.centerX)!
            n.top == (n.superview?.top)! + 100
            n.width == (n.superview?.width)!-60
            n.height == 30
            
            s.width == n.width
            d.width == n.width
            e.width == n.width
            p.width == n.width
            b.width == n.width
            
            s.height == n.height
            e.height == n.height
            d.height == n.height
            p.height == n.height
            b.height == 36
            
            s.centerX == n.centerX
            e.centerX == n.centerX
            d.centerX == n.centerX
            p.centerX == n.centerX
            b.centerX == n.centerX
        
            m.centerX == (m.superview?.centerX)!
            m.height == 20
            m.width == n.width
            
            distribute(by: 10, vertically: n,s,d,e,p)
            distribute(by: 40, vertically: p,b,m)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "twitter-1")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        setupViews()
    }
    
   func TextFields(_ textField:UITextField){
        if textField.text?.count == 0{
            count = count + 1
            textField.setBottomBorderRed()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                 textField.setBottomBorder()
            }
        }
    }
}
