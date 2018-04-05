//
//  Response.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import ObjectMapper

class NEWS: Mappable{
    var date:String?
    var title:String?
    var short_info:String?
    var description:String?
    var link:String?
    required init?(map: Map) {
        
    }
    init(_ link:String,_ title:String,_ short_info:String,_ date:String,_ description:String) {
        self.link = link
        self.title = title
        self.date = date
        self.short_info = short_info
        self.description = description
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        title <- map["title"]
        short_info <- map["short_info"]
        description <- map["description"]
        link <- map["link"]
    }
}


