//
//  AdviceViewController.swift
//  FinalProject
//
//  Created by I on 22.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class AdviceViewController: UIViewController {
    var t = 0
    @IBOutlet weak var tableView: UITableView!
    var currrent_user_name = {
        return Auth.auth().currentUser?.displayName?.components(separatedBy: "%%%")[0]
    }
    private var tweets: [Advice] = []
    private var dbRef: DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
         let  bar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(AdviceViewController.composeButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = bar
        
        dbRef = Database.database().reference() //connect
        dbRef = dbRef?.child("tweet") // create
        dbRef?.observe(DataEventType.value, with: { (snapshot) in //take snapshot
            print(snapshot.childrenCount)
            self.tweets.removeAll()
            for snap in snapshot.children{
                let tweet = Advice.init(snapshot: snap as! DataSnapshot)
                self.tweets.append(tweet)
            }
            self.tweets.reverse()
            self.tableView.reloadData()
        })
        
        
    }
    @objc func composeButtonPressed(_ sender: UIBarButtonItem!) {
        let alertController = UIAlertController(title: "Полезные советы", message: "Что нового?", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Тақырыбы"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "туралы"
        }
       
        let postAction = UIAlertAction(title: "Қосу", style: .default) { (_ ) in
            if(alertController.textFields![0].text != "" && alertController.textFields![1].text != ""){
                let tweet = Advice.init(alertController.textFields![0].text!, alertController.textFields![1].text!, self.currrent_user_name()!, self.currrent_user_name()!)
                self.dbRef?.childByAutoId().setValue(tweet.toJSONFormat())
                self.tweets.append(tweet)
                self.tableView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneAdvice"{
            let destination = segue.destination as! AdviceInfoViewController
            destination.text = tweets[t].Hashtag

        }
    }

}

extension AdviceViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.t = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.adviceCell, for: indexPath) as! AdviceTableViewCell
        cell.nameLbl.text = tweets[indexPath.row].Content
        return cell
    }
    
}
