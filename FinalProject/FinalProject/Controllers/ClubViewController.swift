//
//  ClubViewController.swift
//  FinalProject
//
//  Created by I on 22.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
//import FirebaseCore

class ClubViewController: UIViewController {
    private var tweets: [Advice] = []
    var currrent_user_name:String = {
        return Auth.auth().currentUser?.displayName?.components(separatedBy: "%%%")[0]
        }()!
    private var dbRef: DatabaseReference?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        if(currrent_user_name == "admin"){
            
        }
        super.viewDidLoad()
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("zall")
        dbRef?.observe(DataEventType.value, with: { (snapshot) in
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
    
}

extension ClubViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.clubCell, for: indexPath) as! ClubTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
