//
//  AddNewContactTableViewController.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class AddNewContactTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var GenderPickerView: UIPickerView!
    
    let gender = ["male","female"]
    override func viewDidLoad() {
        GenderPickerView.isHidden = true
        GenderPickerView.delegate = self
        GenderPickerView.dataSource = self
        
        super.viewDidLoad()
    }
    @IBAction func GenderPicked(_ sender: UIButton) {
        if GenderPickerView.isHidden{
            GenderPickerView.isHidden = false
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        GenderPickerView.isHidden = true
    }
    var contact: ContactPerson!
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "SaveSegue"){
            contact = ContactPerson.init(txtFirstName.text!, txtLastName.text!, txtPhoneNumber.text!)
            
        }
    }
 

}
