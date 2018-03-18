//
//  MakeCircle.swift
//  Registration
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class MakeCircle: UIImageView {
    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
