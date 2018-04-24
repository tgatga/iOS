//
//  Tweet.swift
//  SimpleFirebaseApp
//
//  Created by Assel on 03.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Advice{
    private var content: String?
    private var user_email: String?
    private var user_name: String?
    private var hashtag: String?
    
    
    init(_ content: String,_ hashtag: String, _ user_email: String, _ user_name: String ) {
        self.content = content
        self.user_email = user_email
        self.hashtag = hashtag
        self.user_name = user_name
        
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        content = tweet.value(forKey: "content") as? String
        user_email = tweet.value(forKey: "user_email") as? String
        user_name = tweet.value(forKey: "user_name") as? String
        hashtag = tweet.value(forKey: "hashtag") as? String
        
    }
    var Content: String?{
        get{
            return content
        }
    }
    var User_email: String?{
        get{
            return user_email
        }
    }
    var User_name: String?{
        get{
            return user_name
        }
    }
    var Hashtag: String?{
        get{
            return hashtag
        }
    }
    
    func toJSONFormat()-> Any{
        return ["content": content,
                "user_email": user_email,"user_name": user_name,"hashtag" : hashtag]
    }
    
    
}

