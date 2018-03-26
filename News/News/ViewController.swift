//
//  ViewController.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import XLPagerTabStrip
import Cartography

class ViewController: TwitterPagerTabStripViewController, IndicatorDelegate{
    var news:[Int:[NEWS]] = [:]
    lazy var activityView:NVActivityIndicatorView={
        let frame = CGRect(x: (self.view.center.x - 100), y: (self.view.center.y - 100), width: 30, height: 30)
        let indicator = NVActivityIndicatorView(frame: frame, type: .pacman, color: UIColor(red:177/255, green:188/255, blue:201/255, alpha:1), padding: 10)
        return indicator
    }()
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
        add()
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        self.title = ""
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let positiveNewsController = PositiveNews()
        positiveNewsController.delegateIndicat = self
        let negativeNewsController = NegativeNews()
        negativeNewsController.delegateIndicat = self
        return [positiveNewsController,negativeNewsController]
    }
    
    func setup(){
        self.view.backgroundColor = UIColor.white
        self.settings.style.dotColor = UIColor.blue
        self.settings.style.titleColor = UIColor.white
    }

    func add(){
        view.addSubview(activityView)
        activityView.startAnimating()
        constrain(activityView){acti in
            acti.center == (acti.superview?.center)!
            acti.width == (acti.superview?.width)!/3
            acti.height == (acti.superview?.width)!/3
        }
    }
}

