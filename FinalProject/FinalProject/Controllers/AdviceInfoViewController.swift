//
//  AdviceInfoViewController.swift
//  FinalProject
//
//  Created by I on 22.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class AdviceInfoViewController: UIViewController {
    var text:String?
   
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
    }
    
    @IBOutlet weak var textView: UITextView!
}
