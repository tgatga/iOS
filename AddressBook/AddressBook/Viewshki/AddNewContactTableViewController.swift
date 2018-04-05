//
//  AddNewContactTableViewController.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class AddNewContactTableViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var GenderPickerView: UIPickerView!
    var isCheked:String?
    var contact: ContactPerson!
    var mainView: AddressBookTableViewController?
    let gender = ["male","female"]
    override func viewDidLoad() {
        GenderPickerView.delegate = self
        GenderPickerView.dataSource = self
        
        super.viewDidLoad()
    }
//    @IBAction func GenderPicked(_ sender: UIButton) {
//        if GenderPickerView.isHidden{
//            GenderPickerView.isHidden = false
//        }
//    }
    @IBAction func SavingContacts(_ sender: UIBarButtonItem) {
        if txtFirstName.text != nil && txtLastName.text != nil && txtPhoneNumber.text  != nil{
            contact = ContactPerson.init(txtFirstName.text!, txtLastName.text!, txtPhoneNumber.text!)
            print(contact)
            
            self.mainView?.dataSource.contacts.append(contact)
            //self.mainView?.dataSource.addContact(contact: contact)
            
            //print(self.mainView?.dataSource.contacts )
            navigationController?.popViewController(animated: true)
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
        isCheked = gender[row]
        
    }
    
    
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if( segue.identifier == "SaveSegue"){
//            contact = ContactPerson.init(txtFirstName.text!, txtLastName.text!, txtPhoneNumber.text!)
//            //GenderPickerView.selectedRow(inComponent: 0)
//        }
//    }
 

}
