//
//  StartViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = button.frame.width/2
    }
}
