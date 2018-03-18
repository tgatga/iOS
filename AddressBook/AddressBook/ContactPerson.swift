//
//  ContactPerson.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ContactPerson{
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(firstName, forKey: "FirstName")
//        aCoder.encode(lastName, forKey: "LastName")
//        aCoder.encode(number, forKey: "PhoneNumber")
//        //aCoder.encode(gender, forKey: "Gender")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        firstName = aDecoder.decodeObject(forKey: "FirstName") as! String
//        lastName = aDecoder.decodeObject(forKey: "LastName") as! String
//        number = aDecoder.decodeObject(forKey: "PhoneNumber") as! String
//        //gender = aDecoder.decodeObject(forKey: "Gender") as! String
//        super.init()
//    }

    var firstName : String
    var lastName : String
    var number : String
   // var gender : String
    
//    override init(){
//        firstName = "Assel"
//        lastName = "Tolebayeva"
//        number = "87785919974"
//        //gender = "female"
//        super.init()
//    }
    
    init(_ first: String,_ last: String,_ num: String) {
        firstName = first
        lastName = last
        number = num
        //gender = gend
       // super.init()
    }
    
    var FirstName:String{
        get{return firstName}
        set{firstName = newValue}
    }
    var LastName:String{
        get{return lastName}
        set{lastName = newValue}
    }
    var Number:String{
        get{return number}
        set{number = newValue}
    }
    
}
