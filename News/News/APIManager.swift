//
//  APIManager.swift
//  News
//
//  Created by Assel Tolebayeva on 26.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

import PromiseKit

class APIManager{
    var mas:[OneNews] = []
    static let sharedInstance = APIManager()
    private init(){
        
    }
    func fetchPositiveNewsFromApi(api:String) -> Promise<[OneNews]>  {
        return  Promise<[OneNews]> {_ in 
            fullfit,reject -> in Void
in
            return  Alamofire.request(api).responseString{
                response in
                
                switch(response.result){
                case .success(let responString):
                    let result = Mapper<OneNews>().mapArray(JSONString: "\(responString)")
                    for i in result!{
                        self.mas.append(OneNews.init(i.link!, i.title!, i.short_info!, i.date!, i.description!))
                    }
                    fullfit(self.mas)
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func download() -> Promise<String> {
        return Promise { fulfill, reject in
            
            
        }
    }
    
    
}
