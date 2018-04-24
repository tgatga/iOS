//
//  ViewController.swift
//  Weather
//
//  Created by Assel Tolebayeva on 15.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import Alamofire

class MainViewController: UIViewController {
    private var url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=1537162..")!
    
    init(_ cityName: String) {
        url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city..")!
            downloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func downloadData(){
        
        Alamofire.request(url).responseJSON { (responce) in
            if let result = responce.result.value {
                print(result)
                let resultDictionary = result as! NSDictionary
                self.temp = "\(String(describing: (resultDictionary["main"] as! NSDictionary)["temp"]))"
                self.mainData["temp"] = self.temp
                self.humidity = "\(String(describing: (resultDictionary["main"] as! NSDictionary)["humidity"]))"
                self.windSpeed = "\(String(describing: (resultDictionary["wind"] as! NSDictionary)["speed"]))"
                self.sunriseTime = "\(String(describing: (resultDictionary["sys"] as! NSDictionary)["sunrise"]))"
                self.sunsetTime = "\(String(describing: (resultDictionary["sys"] as! NSDictionary)["sunset"]))"
            }
        }
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back")
        self.view.insertSubview(backgroundImage, at: 0)
       
        setUpAddItems()
    }

    func setUpAddItems() {
        view.addSubview(Label)
        view.addSubview(citylabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(info)

        constrain(Label,citylabel,textField,button,info){ Label,citylabel,textField,button,info in
            Label.centerX == (Label.superview?.centerX)!
            Label.top == (Label.superview?.top)! + view.bounds.width/4
            
            citylabel.centerX == (Label.superview?.centerX)!

            textField.centerX == Label.centerX
            textField.height == 30
            textField.width == (textField.superview?.width)! - 50
            
            button.centerX ==  Label.centerX
            button.width == 80
            button.height == 30
            
            distribute(by: 20 , vertically:Label,citylabel,textField,button)
        }

    }
    lazy var Label: UILabel = {
        let label = UILabel()
        label.text = "What is the weather?"
        label.font = UIFont(name:"HelveticaNeue", size: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var citylabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your city"
        label.font = UIFont(name:"HelveticaNeue", size: 14)
        return label
    }()
    lazy var textField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E.g. Almaty, New York"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 10
        
        return tf
    }()
    lazy var button : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Submit", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    lazy var info : UILabel = {
        let label = UILabel()
        return label
    }()

}

