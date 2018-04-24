//
//  LoginViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import  Cartography
import AAPickerView
import XLPagerTabStrip
class OneViewController: UIViewController {
    let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    
    lazy var name_field : UITextField = {
        let n = UITextField()
        n.placeholder = "Имя"
        n.tintColor = twitterColor
        n.textColor = twitterColor
        n.font = UIFont(name: "Helvetica", size: 14)
        //n.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        n.backgroundColor = .white
        n.isUserInteractionEnabled = false
        n.setBottomBorder()
        n.becomeFirstResponder()
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
        p.isUserInteractionEnabled = false
        p.font = UIFont(name: "Helvetica", size: 14)
        return p
    }()
    lazy var email_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Эл. почта"
        f.backgroundColor = .white
        f.keyboardType = .emailAddress
        f.font = UIFont(name: "Helvetica", size: 14)
        f.tintColor = twitterColor
        f.isUserInteractionEnabled = false
        f.textColor = .gray
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
        f.isUserInteractionEnabled = false
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
        b.setTitle("Выйти", for: .normal)
        b.backgroundColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1)
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

    
    @objc func buttonSignUp(){
        do{
            try Auth.auth().signOut()
        }catch{
            
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func sal(){
        if let a = Auth.auth().currentUser?.displayName {
            let userVal = a.components(separatedBy: "%%%")
            name_field.text = "\(userVal[0]) \(userVal[1])"
            bday_field.text = userVal[2]
            email_field.text = Auth.auth().currentUser?.email
        }
    }
    
    func setupViews(){
        view.addSubview(name_field)
        view.addSubview(bday_field)
        view.addSubview(email_field)
        view.addSubview(signupButton)
        
        constrain(name_field,bday_field, email_field,signupButton){ n,d,e,b in
            n.centerX == (n.superview?.centerX)!
            n.top == (n.superview?.top)! + 100
            n.width == (n.superview?.width)!/1.2
            n.height == 40
            
            d.width == n.width
            e.width == n.width
            b.width == n.width
           
            e.height == 20
            d.height == 20
            b.height == 36
            
            e.centerX == n.centerX
            d.centerX == n.centerX
            b.centerX == n.centerX
            
            distribute(by: 2, vertically: n,e)
            distribute(by: 2, vertically: e,d)
            distribute(by: 40, vertically: d,b)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        setupViews()
        sal()
    }
}
// MARK: - IndicatorInfoProvider
extension OneViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Profile")
    }
    
}
