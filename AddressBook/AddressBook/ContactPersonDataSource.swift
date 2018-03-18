//
//  ContactPersonDataSource.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ContactPersonDataSource: NSObject {
    var contacts = NSMutableArray()
    override init() {
        super.init()
        loadContact()
    }
    
    func loadContact(){
        let fileURL = getFileURL()
        if(FileManager.default.fileExists(atPath: fileURL.path)){
            let contents = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as! NSArray
            contacts.addObjects(from: contents as! [Any])
        }else{
            
            let sample2 = ContactPerson( "Asel", "Tolebaeva",  "8778")
            addContact(contact: sample2)
            saveContacts()
        }
    }
    
    func getFileURL() -> URL {
        let fileManager = FileManager.default
        let homeDir = try! fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
        let fileURL = homeDir.appendingPathComponent("addressbook.data")
        return fileURL
    }
    
    func saveContacts(){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: fileURL.path)
    }
    func addContact(contact c: ContactPerson){
        contacts.add(c)
    }
    func countOfContacts() -> Int {
        return contacts.count
    }
    func contactAtIndex(index i: Int) -> ContactPerson {
        return contacts.object(at: i) as! ContactPerson
    }
    func deleteContact(at index: Int){
        contacts.removeObject(at: index)
        saveContacts()
    }
    func moveContacts(from fromIndex: Int, to toIndex: Int){
        let fromContact = contactAtIndex(index: fromIndex)
        let toContact = contactAtIndex(index: toIndex)
        contacts.replaceObject(at: fromIndex, with: toContact)
        contacts.replaceObject(at: toIndex, with: fromContact)
        saveContacts()
    }
}
