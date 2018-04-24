//
//  DietaViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    @IBAction func timeLabel(_ sender: Any) {
        let alertController = UIAlertController(title: "Полезные советы", message: "Что нового?", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Тақырыбы"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "туралы"
        }
        
        let postAction = UIAlertAction(title: "Қосу", style: .default) { (_ ) in
            if(alertController.textFields![0].text != "" && alertController.textFields![1].text != ""){
               
                print(alertController.textFields![0].text!)
                print(alertController.textFields![1].text!)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.navigationController?.isNavigationBarHidden = true
    }    
}
extension FoodViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.foodCell, for: indexPath) as! FoodTableViewCell
        
        return cell
    }
    

}
