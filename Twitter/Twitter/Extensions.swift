//
//  Extensions.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 14.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.3)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 0.0
    }
    func setBottomBorderRed() {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.3)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 0.0
    }
}
