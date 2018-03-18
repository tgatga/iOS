//
//  University.swift
//  SDUProject1
//
//  Created by Assel Tolebayeva on 07.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class University: UITableViewController {

    let cellName = ["NEWS","SDU Clubs","SDU Faculties", "SDU Galery"]
    let cellImages = [#imageLiteral(resourceName: "News-icon"),#imageLiteral(resourceName: "clubs-1"),#imageLiteral(resourceName: "faculty"),#imageLiteral(resourceName: "gallery-1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! Univer_Cell
            cell.blocks.image = #imageLiteral(resourceName: "block")
            cell.block2.image = cellImages[0]
            cell.blockLbl.text = cellName[0]
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "clubs", for: indexPath) as! Univer_Cell
            
            cell.blocks.image = #imageLiteral(resourceName: "block")
            cell.block2.image = cellImages[1]
            cell.blockLbl.text = cellName[1]

            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "faculty", for: indexPath) as! Univer_Cell
            cell.blocks.image = #imageLiteral(resourceName: "block")
            cell.block2.image = cellImages[2]
            cell.blockLbl.text = cellName[2]

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "galery", for: indexPath) as! Univer_Cell
            cell.blocks.image = #imageLiteral(resourceName: "block")
            cell.block2.image = cellImages[3]
            cell.blockLbl.text = cellName[3]

            return cell
            
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
