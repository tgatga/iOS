//
//  TableViewController.swift
//  SDU
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
protocol Delegate {
    var websites:[Website]{get}
}
class Master: UITableViewController, Delegate {
    
    
    
    let websites: [Website] = [
        Website.init("SDU Portal", "https://my.sdu.edu.kz")
    ]
    
    let Selections = ["SDU Portal","University","Contacts"]
    let SelectionImages = [#imageLiteral(resourceName: "portal-icon"),#imageLiteral(resourceName: "university"),#imageLiteral(resourceName: "contacts")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Selections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "webCell", for: indexPath) as! Master_Cell
            cell.WebCellImage.image = SelectionImages[0]
            cell.WebCellLable.text = Selections[0]
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Master_Cell
            cell.SelectionCellLable.text = Selections[indexPath.row]
            cell.SelectionCellImage.image = SelectionImages[indexPath.row]
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! Master_Cell
                cell.SelectionCellLable.text = Selections[2]
                cell.SelectionCellImage.image = SelectionImages[2]
            return cell
            
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSegue" {
            let desination = segue.destination as! Web_View
            desination.index = tableView.indexPathForSelectedRow?.row
            desination.delegate = self
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
