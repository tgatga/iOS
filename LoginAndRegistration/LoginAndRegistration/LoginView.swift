//
//  LoginView.swift
//  LoginAndRegistration
//
//  Created by Assel Tolebayeva on 21.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
class LoginView : UIView{
    var loginAction : (() -> Void)?
    var regAction : (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
        let stackView = secondStackView()
        
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width-60, height: 190)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        addSubview(TitleImage)
        addSubview(titleLabel)
        TitleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        TitleImage.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 252).isActive = true
        
        addSubview(forgotPassword)
        
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        forgotPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 7).isActive = true
        forgotPassword.rightAnchor.constraint(equalTo: rightAnchor, constant: -17).isActive = true
        
        
        addSubview(regButton)
        regButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        regButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        addSubview(RegistrationLabel)
        RegistrationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive=true
        RegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
    
    let TitleImage: UIImageView = {
        let i = UIImageView()
        i.layer.masksToBounds = true
        i.backgroundColor = UIColor(red: 220/255, green: 236/255, blue: 234/255, alpha: 1)
        i.setAnchor(width: 130, height: 130)
        i.layer.cornerRadius = 65
        
        return i
    }()
    
    let titleLabel : UILabel = {
        let l = UILabel()
        l.textColor = UIColor(red: 37/255, green: 58/255, blue: 120/255, alpha: 1)
        l.text = "Вход"
        l.font = UIFont(name:"HelveticaNeue-Bold", size:29.0)
        l.setAnchor(width: 74, height: 35)
        return l
    }()
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 20
        tf.textColor = UIColor(red: 37/255, green: 58/255, blue: 120/255, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.autocorrectionType = .no
        tf.borderStyle = UITextBorderStyle.roundedRect
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSMutableAttributedString(string: "Введите ваш номер или эл. почту", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.gray]))
        tf.attributedPlaceholder = placeholder
        tf.setAnchor(width: 336, height: 40)
        tf.setLeftPaddingPoints(20)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 20
        tf.textColor = UIColor(red: 37/255, green: 58/255, blue: 120/255, alpha: 1)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.autocorrectionType = .no
        tf.borderStyle = UITextBorderStyle.roundedRect
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSMutableAttributedString(string: "Пароль", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.gray]))
        tf.attributedPlaceholder = placeholder
        tf.setAnchor(width: 336, height: 40)
        tf.setLeftPaddingPoints(20)
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Войти", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 20
        
        button.backgroundColor = UIColor(red: 37/255, green: 58/255, blue: 120/255, alpha: 1)
        button.setAnchor(width: 336, height: 40)
        //button.addTarget(self, action: #selector(handleLogin), for: )
        return button
    }()
    
    let forgotPassword : UILabel = {
        let l = UILabel()
        l.textColor = UIColor.gray
        l.text = "Забыли пароль?"
        l.font = UIFont.systemFont(ofSize: 16)
        l.setAnchor(width: 130, height: 21)
        
        return l
    }()
    
    let RegistrationLabel : UILabel = {
        let l = UILabel()
        l.textColor = UIColor.gray
        l.text = "Вы не зарегестрированы?"
        l.font = UIFont.systemFont(ofSize: 16)
        l.setAnchor(width: 210, height: 21)
        return l
    }()
    
    let regButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Создать", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(red: 37/255, green: 58/255, blue: 120/255, alpha: 1)]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 220/255, green: 236/255, blue: 234/255, alpha: 1)
        button.setAnchor(width: 108, height: 40)
        return button
    }()
    
    func firstStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }
    func secondStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [firstStackView(),loginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 50
        return stackView
    }

    
    @objc func handleLogin(){
        loginAction?()
    }
    @objc func handleReg(){
        regAction?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented!")
    }
}


