//
//  Website.swift
//  Assigment-4(WebBrowser)
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
class Website{
    private var title : String?
    private var url : String?
    var isChecked: Bool?
    
    init(_ title : String?, _ url : String, _ isChecked: Bool) {
        self.title = title
        self.url = url
        self.isChecked = isChecked
    }
    var Title : String?{
        get{return title}
    }
    var BrowserUrl : String?{
        get{return url}
    }
    var IsChecked: Bool?{
        get{return isChecked}
        set{isChecked = newValue}
    }
}
