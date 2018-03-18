//
//  AddressBookTableViewController.swift
//  AddressBook
//
//  Created by MacPro on 06.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class AddressBookTableViewController: UITableViewController {
    let dataSource = ContactPersonDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (dataSource.contacti.count)
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let cellContacts = dataSource.contactAtIndex(index: indexPath.row)
        cell.textLabel?.text = cellContacts.lastName
        cell.detailTextLabel?.text = cellContacts.firstName

        return cell
    }
  

 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
 

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.deleteContact(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   


    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        dataSource.moveContacts(from: fromIndexPath.row, to: to.row)
//    }
    

   
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if( segue.identifier == "ContactDetailSegue"){
//            let selectedIndex = tableView.indexPathForSelectedRow?.row
//            let selectedContact = dataSource.contactAtIndex(index: selectedIndex!)
//            let destination = segue.destination as! ContactDetailsTableViewController
//            destination.contact = selectedContact
//        }
//
//
//    }
    @IBAction func cancel(NewContract segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(SaveSegue segue: UIStoryboardSegue){
        let source = segue.source as! AddNewContactTableViewController
        let newContact = source.contact
        dataSource.addContact(contact: newContact!)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

}
