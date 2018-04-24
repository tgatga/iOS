//
//  FeedbackController.swift
//  Sushi
//
//  Created by Nazhmeddin Babakhanov on 4/11/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography
import Cosmos
import AAPickerView
import SwiftyButton

class FeedbackController: UIViewController {
    
    lazy var viewPart:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    lazy var viewPartOtziv:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    lazy var nameLabel: UITextField = {
        let name =  UITextField()
        
        name.placeholder = "Имя"
        //name.layer.sublayerTransform = CATransform3DMakeTranslation(10, 2, 0)
        name.backgroundColor = .white
        name.setBottomBorder()
        name.delegate = self
       
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var surnameLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Фамилия"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var emailLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Электроная почта"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var telefoneLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Телефон"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var textLabel:UILabel = {
        let text = UILabel()
        text.text = "ОЦЕНИТЕ НАС"
        return text
    }()
    
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.rating = 5
        rate.didFinishTouchingCosmos = { rating in }
        
        
        rate.didTouchCosmos = { rating in }
        return rate
    }()
    
   
    
    lazy var pickerView:AAPickerView = {
        let picker = AAPickerView()
        picker.pickerType = .StringPicker
        picker.text = "Выберите"

        picker.stringPickerData = Constant.nameSelect
        picker.pickerRow.font = UIFont(name: "American Typewriter", size: 30)
        
        picker.toolbar.barTintColor = .darkGray
        picker.toolbar.tintColor = .black
        
        
        
        picker.stringDidChange = { index in
            
            print("selectedString ", Constant.nameSelect[index])
            
            
        }
        return picker
    }()
    
    lazy var reviewLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.delegate = self
        name.placeholder = "Отзыв"
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var shareButton: CustomPressableButton = {
        let share = CustomPressableButton()
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        share.contentView.addSubview(indicator)
        
        let label = UILabel()
        share.contentView.addSubview(label)
       
        label.text = "Loading..."
        label.textAlignment = .center
        label.textColor = .white
        
        constrain(indicator,label){indicator,label in
            indicator.centerY == (indicator.superview?.centerY)!
            indicator.left == (indicator.superview?.left)! + 20
            
            label.width == (label.superview?.width)!
            label.height == (label.superview?.height)!/2
            label.center ==  (label.superview?.center)!
           
            
            //distribute(by: 30, horizontally: indicator,label)
        }
        
        indicator.startAnimating()
        
       
        return share
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Обратная связь"
        self.view.backgroundColor =  UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        setupViews()
        setupConstrain()
        
        
    }
    
    func setupConstrain(){
        constrain( viewPart,nameLabel,surnameLabel,emailLabel,telefoneLabel,textLabel,rateView,reviewLabel,viewPartOtziv,pickerView){part,name,surname,email,telefone,text,rate,review,PartOtziv,picker in
            
            part.width == (part.superview?.width)!
            part.height == (part.superview?.height)!/4
            part.top == (part.superview?.top)! +  100
            
            name.top == (name.superview?.top)!
            name.width == self.view.bounds.width - 15
            name.height == (name.superview?.height)!/4
            name.right == (name.superview?.right)! - 5
            
            
            
            surname.width == name.width
            surname.height == name.height
            surname.centerX == name.centerX
            
            email.width == name.width
            email.height == name.height
            email.centerX == name.centerX
            
            telefone.width == name.width
            telefone.height == name.height
            telefone.centerX == name.centerX
            
            text.width == name.width
            text.height == name.height
            text.left == (text.superview?.left)! + 30
            
            rate.width == name.width
            rate.height == name.height/2.5
            rate.right ==  (rate.superview?.right)! + 200
            rate.centerY == text.centerY
            
            PartOtziv.height == (PartOtziv.superview?.height)!/6
            PartOtziv.width == (PartOtziv.superview?.width)!
            PartOtziv.top == rate.bottom + 20
            
            
            picker.width == name.width
            picker.height == name.height
            picker.top ==  PartOtziv.top
            picker.centerX == name.centerX
            
            review.width == name.width
            review.height == name.height
            review.centerX == name.centerX
            
            
            
            distribute(by:1 , vertically:name,surname,email,telefone)
            
            distribute(by: 20, vertically: telefone,text)
            distribute(by: 1, vertically: picker,review)
            
        }
        
        constrain(viewPartOtziv,shareButton,nameLabel){PartOtziv,share,name in
            share.width == (share.superview?.width)!/2
            share.height == name.height
            share.centerX == (share.superview?.centerX)!
            share.bottom == PartOtziv.bottom + 100
            
        }
    }
    
    func setupViews(){
        self.view.addSubview(viewPart)
        self.viewPart.addSubview(nameLabel)
        self.viewPart.addSubview(surnameLabel)
        self.viewPart.addSubview(emailLabel)
        self.viewPart.addSubview(telefoneLabel)
        self.view.addSubview(textLabel)
        self.view.addSubview(rateView)
        self.view.addSubview(viewPartOtziv)
        self.viewPartOtziv.addSubview(pickerView)
        self.viewPartOtziv.addSubview(reviewLabel)
        self.view.addSubview(shareButton)
        
       
        

    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension FeedbackController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
}


extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = "#C7C7CD".hexColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
