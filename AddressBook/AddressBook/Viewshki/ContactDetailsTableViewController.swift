//
//  ContactDetailsTableViewController.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ContactDetailsTableViewController: UITableViewController {
    var control:AddressBookTableViewController?
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    //@IBOutlet weak var lblGender: UIView!
    
    @IBOutlet weak var ContactImage: UIImageView!
    var contact : ContactPerson!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFirstName.text = contact.firstName
        lblLastName.text = contact.lastName
        //lblGender.text = contact.gender
        lblNumber.text = contact.number
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
