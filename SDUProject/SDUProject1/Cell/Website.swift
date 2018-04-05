//
//  Website.swift
//  Assigment-4(WebBrowser)
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
struct Website{
    private var title : String?
    private var url : String?
    init(_ title : String , _ url: String ){
        self.title = title
        self.url = url
    }
    
    var Title : String?{
        get{return title}
        set{title = newValue}
    }
    var BrowserUrl : String?{
        get{return url}
        set{url = newValue}
    }
}


