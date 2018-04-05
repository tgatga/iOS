//
//  Response.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper
import SwiftyJSON

class APIManager{
    var news:[NEWS] = []
    static let sharedInstance = APIManager()
    private init(){
    }
    func fetchPositiveNewsFromApi(api:String) -> [NEWS]{
        if let path = Bundle.main.path(forResource: api, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonData = try JSON(data: data)
                
                if jsonData != JSON.null {
                    let result = Mapper<NEWS>().mapArray(JSONString: "\(jsonData)")
                    for i in result!{
                        news.append(NEWS.init(i.link!, i.title!, i.short_info!, i.date!, i.description!))
                    }
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return news
    } 
}
