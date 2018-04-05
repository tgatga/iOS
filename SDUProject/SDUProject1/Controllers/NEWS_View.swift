//
//  NEWS_View.swift
//  SDU
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class NEWS_View: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let newsImg = [#imageLiteral(resourceName: "n1"),#imageLiteral(resourceName: "n2"),#imageLiteral(resourceName: "n3"),#imageLiteral(resourceName: "n4")]
    let newsTxt = ["Свыше 12 тысяч абитуриентов приняли участие в олимпиаде SPT",
                   "Приглашаем принять участие в научной конференции",
                   "Зимние Математические Игры 2018",
                   "Гранты на обучение – лучшая инвестиция в будущее"
                   ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsImg.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eachNew", for: indexPath) as! NEWS_Cell
        cell.newsImage.image = newsImg[indexPath.row]
        cell.newsLabel.text = newsTxt[indexPath.row]
    
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
