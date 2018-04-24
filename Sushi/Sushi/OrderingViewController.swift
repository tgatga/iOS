//
//  OrderingViewController.swift
//  Sushi
//
//  Created by Nazhmeddin Babakhanov on 4/12/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//
/// self.someTextField.keyboardType = UIKeyboardType.decimalPad sango san


import UIKit
import Cartography
import AAPickerView
import SwiftyButton

class OrderingViewController: UIViewController {

    
    
    lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        scroll.contentSize.height = self.view.bounds.height * 1.3
        return scroll
    }()
    
    lazy var PersonalDataLabel:UILabel = {
        let text = UILabel()
        text.text = "ПЕРСОНАЛЬНЫЕ ДАННЫЕ"
        text.textAlignment = .left
        text.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        return text
    }()
    
    lazy var TelefonView:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    
    lazy var telefonLabel: UITextField = {
        let name =  UITextField()
        name.placeholder = "Телефон"
        name.backgroundColor = .white
        name.setBottomBorder()
        name.delegate = self
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var SendCodeLabel: UILabel = {
        let text =  UILabel()
        text.text = "на него будет отправлен код проверки"
        text.font = UIFont.systemFont(ofSize: 15)
        text.textAlignment = .left
        text.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        return text
    }()
    
    lazy var viewPart:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    lazy var viewPartDelivery:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    lazy var viewPayment:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    
    lazy var nameLabel: UITextField = {
        let name =  UITextField()
        name.placeholder = "Имя"
        name.backgroundColor = .white
        name.setBottomBorder()
        name.delegate = self
        
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var surnameLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Фамилия (опционально)"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var deliveryLabel:UILabel = {
        let text = UILabel()
        text.text = "ДОСТАВКА"
        text.textAlignment = .left
        text.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        return text
    }()
    
    lazy var adressLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Адрес доставки"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var pickerView:AAPickerView = {
        let picker = AAPickerView()
        picker.pickerType = .StringPicker
        picker.text = "Доставка курьером"
        
        picker.rightViewMode = .always
        picker.rightView = UIImageView(image: UIImage(named: "more"))
        picker.stringPickerData = Constant.namesDelivery
        picker.pickerRow.font = UIFont(name: "American Typewriter", size: 30)
        
        picker.toolbar.barTintColor = .darkGray
        picker.toolbar.tintColor = .black
        picker.setBottomBorder()
        
        picker.stringDidChange = { index in
            print("selectedString ", Constant.namesDelivery[index])
        }
        return picker
    }()
    
    lazy var pickerViewData:AAPickerView = {
        let picker = AAPickerView()
        picker.pickerType = .DatePicker
        picker.text = "Выберите дату"
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "yyyy-MM-dd' в 'HH:mm"
        picker.rightViewMode = .always
        picker.rightView = UIImageView(image: UIImage(named: "more"))
        picker.setBottomBorder()
        picker.dateDidChange = { date in
            print("selectedDate ", date )
        }
        return picker
    }()
    
    lazy var PaymentpickerView:AAPickerView = {
        let picker = AAPickerView()
        picker.pickerType = .StringPicker
        picker.text = "Оплата наличнымы"
        
        picker.rightViewMode = .always
        picker.rightView = UIImageView(image: UIImage(named: "more"))
        picker.stringPickerData = ["Оплата наличнымы"]
        picker.pickerRow.font = UIFont(name: "American Typewriter", size: 30)
        
        picker.toolbar.barTintColor = .darkGray
        picker.toolbar.tintColor = .black
        picker.setBottomBorder()
        
        picker.stringDidChange = { index in
            print("selectedString ",  picker.stringPickerData![index])
        }
        return picker
    }()
    
    lazy var CommentLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.delegate = self
        name.placeholder = "Комментарий к заказу"
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        return name
    }()
    
    lazy var paymentLabel:UILabel = {
        let text = UILabel()
        text.text = "ОПЛАТА"
        text.textAlignment = .left
        text.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        return text
    }()
    
    lazy var surrenderLabel: UITextField = {
        let name =  UITextField()
        name.setBottomBorder()
        name.placeholder = "Сдача с суммы"
        name.delegate = self
        name.backgroundColor = .white
        name.clearButtonMode = .whileEditing
        name.keyboardType = .decimalPad
        return name
    }()
    
    lazy var totalAmountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "ОБЩАЯ СУММА ЗАКАЗА"
        lbl.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var totalAmountSanLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "15 100,00 T"
        lbl.font = UIFont.systemFont(ofSize: 30)
        lbl.textAlignment = .right
        return lbl
    }()
   
    lazy var minitotalAmountSanLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Заказ: 15 100,00 T"
        lbl.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var miniDeriveryLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Доставка: 0 T"
        lbl.textColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var shareButton: CustomPressableButton = {
        let share = CustomPressableButton()
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        share.contentView.addSubview(indicator)
        
        let label = UILabel()
        share.contentView.addSubview(label)
       //share.backgroundColor = .red
        label.text = "Заказать"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        constrain(indicator,label){indicator,label in
            indicator.centerY == (indicator.superview?.centerY)!
            indicator.left == (indicator.superview?.left)! + 20
            
            label.width == (label.superview?.width)!
            label.height == (label.superview?.height)!/2
            label.center ==  (label.superview?.center)!
          
        }
        
        //indicator.startAnimating()
        
        
        return share
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.086, green:0.086, blue:0.086, alpha:1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.title = "Ordering"
        self.view.backgroundColor =  UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        setupViews()
        setupConstrain()
    }
    
    func setupConstrain(){
        constrain( scrollView,PersonalDataLabel,telefonLabel,TelefonView,SendCodeLabel,viewPart,nameLabel,surnameLabel,deliveryLabel ){ scrollView,personal,telefon,TelefonView,SendCode,part,name,surname,delivery in
            scrollView.width == (scrollView.superview?.width)!
            scrollView.height == (scrollView.superview?.height)!
            scrollView.top == (scrollView.superview?.top)!+50
            
            personal.width == (personal.superview?.width)! - 20
            personal.height == (personal.superview?.width)!/11
            personal.left == (personal.superview?.left)! + 15
            personal.top == (personal.superview?.top)! + 10
            
            
            TelefonView.width == (TelefonView.superview?.width)!
            TelefonView.height == (TelefonView.superview?.width)!/9.9
            
            telefon.width == personal.width
            telefon.height == personal.height
            telefon.centerY == TelefonView.centerY
            telefon.left == (telefon.superview?.left)! + 15
            
            SendCode.width == personal.width
            SendCode.height == personal.height
            SendCode.centerX == personal.centerX
            
            
            part.width == (part.superview?.width)!
            part.height == (part.superview?.height)!/7.9
        
            
            name.top == (name.superview?.top)!
            name.width == (name.superview?.width)! - 20
            name.height == (name.superview?.height)!/2
            name.left == (name.superview?.left)! + 15
            
            
            surname.width == name.width
            surname.height == name.height
            surname.centerX == name.centerX
            
            delivery.width == name.width
            delivery.height == name.height
            delivery.centerX == name.centerX
            
            distribute(by:1 , vertically:name,surname)
            distribute(by: 1, vertically: personal,TelefonView,SendCode,part,delivery)
        }
        
        
        constrain(deliveryLabel,viewPartDelivery,nameLabel,pickerView,adressLabel,pickerViewData,CommentLabel,paymentLabel,viewPayment,PaymentpickerView){ delivery , viewPartDelivery,name,picker,adress,pickerViewData,Comment,payment,viewPayment,PaymentpickerView in
            
            viewPartDelivery.width == (viewPartDelivery.superview?.width)!
            viewPartDelivery.height == (viewPartDelivery.superview?.height)!/3.9
            
            picker.width == name.width
            picker.height == name.height
            picker.top ==  viewPartDelivery.top
            picker.centerX == name.centerX
            
            adress.width == name.width
            adress.height == name.height
            adress.centerX == name.centerX
            
            pickerViewData.width == name.width
            pickerViewData.height == name.height
            pickerViewData.centerX == name.centerX
            
            Comment.width == name.width
            Comment.height == name.height
            Comment.centerX == name.centerX
            
            payment.width == name.width
            payment.height == name.height
            payment.centerX == name.centerX
            
            viewPayment.width == (viewPayment.superview?.width)!
            viewPayment.height == (viewPayment.superview?.height)!/7.9
            
            PaymentpickerView.width == name.width
            PaymentpickerView.height == name.height
            PaymentpickerView.centerX == name.centerX
            PaymentpickerView.top ==  viewPayment.top
           
            distribute(by: 1, vertically: delivery,viewPartDelivery)
            distribute(by: 1, vertically: picker,adress,pickerViewData,Comment,payment,viewPayment)
        }
        
        constrain(PaymentpickerView,surrenderLabel,nameLabel,totalAmountLabel,totalAmountSanLabel,minitotalAmountSanLabel,miniDeriveryLabel,shareButton){ PaymentpickerView,surrender,name,totalAmount,totalAmountSan,minitotalAmount,miniDerivery,shareButton in
            surrender.width == name.width
            surrender.height == name.height
            surrender.centerX == name.centerX
            
            totalAmount.width == name.width
            totalAmount.height == name.height
            totalAmount.left == (totalAmount.superview?.left)!
            
            totalAmountSan.width == name.width
            totalAmountSan.height == name.height
            totalAmountSan.left == (totalAmountSan.superview?.left)!
            
            minitotalAmount.width == name.width
            minitotalAmount.height == name.height/2
            minitotalAmount.left == (totalAmountSan.superview?.left)!
            
            miniDerivery.width == name.width
            miniDerivery.height == name.height/3
            miniDerivery.left == (totalAmountSan.superview?.left)!
            
            shareButton.width == (shareButton.superview?.width)!/1.3
            shareButton.centerX == (shareButton.superview?.centerX)!
            shareButton.height == name.height
            
            distribute(by: 1, vertically: PaymentpickerView,surrender,totalAmount,totalAmountSan,minitotalAmount,miniDerivery)
            distribute(by: 10, vertically: miniDerivery,shareButton)
            
        
        }
    }
    
    func setupViews(){
        self.view.addSubview(scrollView)
       self.scrollView.addViews([PersonalDataLabel,TelefonView,SendCodeLabel,viewPart,deliveryLabel,viewPartDelivery,paymentLabel,viewPayment,totalAmountLabel,totalAmountSanLabel,minitotalAmountSanLabel,miniDeriveryLabel,shareButton])
        self.TelefonView.addSubview(telefonLabel)
        self.viewPart.addSubview(nameLabel)
        self.viewPart.addSubview(surnameLabel)
        
        self.viewPartDelivery.addSubview(pickerView)
        self.viewPartDelivery.addSubview(adressLabel)
        self.viewPartDelivery.addSubview(pickerViewData)
        self.viewPartDelivery.addSubview(CommentLabel)
        
        self.viewPayment.addSubview(PaymentpickerView)
        self.viewPayment.addSubview(surrenderLabel)
    }
   
    
    
}

extension OrderingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
extension UIScrollView{
    func addViews(_ view:[UIView]){
        for i in view{
            self.addSubview(i)
        }
    }
}


