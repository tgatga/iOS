//
//  LoginViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseAuth
import Firebase
import FirebaseDatabase
import XLPagerTabStrip

class ProfileViewController: UIViewController {
    var itemInfo: IndicatorInfo = ""
     var searchActive : Bool = false
    var keys:[String] = []
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(ProfileCell.self, forCellReuseIdentifier: "myCell")
        table.rowHeight = 120
        table.separatorStyle = .none
        table.backgroundColor = UIColor(red: 0.949019607843137, green: 0.949019607843137, blue: 0.952941176470588, alpha: 1.0)
        return table
    }()
    
    lazy var searchBar : UISearchBar = {
        let s = UISearchBar()
        s.placeholder = " Поиск... "
        s.searchBarStyle = UISearchBarStyle.minimal
        s.backgroundColor = .white
        s.barTintColor = .white
        return s
    }()
    
    lazy var barRightButton:UIBarButtonItem = {
        let barRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(ProfileViewController.composeButtonPressed(_:)))
        return barRight
    }()

    lazy var AddButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        button.clipsToBounds  = true
        button.addTarget(self, action: #selector(ProfileViewController.composeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var tw:[Tweet] = []
    private var tweets: [Tweet] = []
    private var dbRef: DatabaseReference?
    var current_user_email = {
        return Auth.auth().currentUser?.email
    }
    var currrent_user_name = {
        return Auth.auth().currentUser?.displayName?.components(separatedBy: "%%%")[0]
    }
    
    @objc func buttonCancel(){
       // self.present, animated: false, completion:nil )
        do{
            try Auth.auth().signOut()
        }catch{
            
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrain()
        searchBar.delegate = self
        
        self.searchBar.delegate = self
        self.searchBar.returnKeyType = .done
        dbRef = Database.database().reference() //connect
        dbRef = dbRef?.child("tweet") // create
        dbRef?.observe(DataEventType.value, with: { (snapshot) in //take snapshot
            print(snapshot.childrenCount)
            self.tweets.removeAll()
            for snap in snapshot.children{
                let tweet = Tweet.init(snapshot: snap as! DataSnapshot)
                self.tweets.append(tweet)
            }
            self.tweets.reverse()
            self.tableView.reloadData()
        })
    }
    lazy var view1:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 0.15 )
        return v
    }()
    
    @objc func composeButtonPressed(_ sender: UIBarButtonItem!) {
        let alertController = UIAlertController(title: "Новый твит", message: "Что нового?", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Tweet"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Hashtag"
        }
        let postAction = UIAlertAction(title: "Твитнуть", style: .default) { (_ ) in
            if(alertController.textFields![0].text != "" && alertController.textFields![1].text != ""){
                let tweet = Tweet.init(alertController.textFields![0].text!, alertController.textFields![1].text!, self.current_user_email()!, self.currrent_user_name()!)
                self.dbRef?.childByAutoId().setValue(tweet.toJSONFormat())
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func setupViews(){
        self.view.addViews([tableView,AddButton,searchBar,view1])
    }
    func setupConstrain(){
        constrain(tableView,AddButton,searchBar,view1){tableView,AddButton,s,v1 in
            s.top == (s.superview?.top)!
            s.centerX == (s.superview?.centerX)!
            s.width == tableView.width
            s.height == 50
            
            v1.width == tableView.width
            v1.height == 1.0
            v1.centerX == (s.superview?.centerX)!
            v1.bottom == s.bottom
            
            tableView.width == tableView.superview!.width
            tableView.height == tableView.superview!.height
            tableView.top ==  s.bottom
            
            AddButton.bottom == AddButton.superview!.bottom - view.bounds.width/5
            AddButton.right == AddButton.superview!.right - view.bounds.width/20
            AddButton.width == AddButton.superview!.width/8
            AddButton.height == AddButton.superview!.width/8
        }
    }

}
//Mark TableView, Search
extension ProfileViewController : UITableViewDataSource, UITableViewDelegate , UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive{
            return tw.count
        }
        return tweets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ProfileCell
        if searchActive{
            cell.nameLabel.text = tw[indexPath.row].User_name
            cell.hashtagLabel.text = tw[indexPath.row].Hashtag
            cell.nameUserLabel.text = tw[indexPath.row].User_email
            cell.titleLabel.text = tw[indexPath.row].Content
        }
        else{
            cell.nameLabel.text = tweets[indexPath.row].User_name
            cell.hashtagLabel.text = tweets[indexPath.row].Hashtag
            cell.nameUserLabel.text = tweets[indexPath.row].User_email
            cell.titleLabel.text = tweets[indexPath.row].Content
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let uiAlert = UIAlertController(title: "Delete", message: "", preferredStyle: UIAlertControllerStyle.alert)
        getVal()
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.dbRef?.child(self.keys[indexPath.row]).removeValue()
            self.tweets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.keys = []
            tableView.reloadData()
            print("Click of default button")
        }))
        
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Click of cancel button")
        }))
        self.present(uiAlert, animated: true, completion: nil)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil && searchBar.text == "" {
            searchActive = false
            view.endEditing(true)
        }else{
            searchActive = true
            tw = searchText.isEmpty ? tweets : tweets.filter({ (item: Tweet) -> Bool in
                return item.Hashtag?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            })
        }
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func getVal(){
        dbRef?.observe(.value, with: { (snapshot) in
                for snap in snapshot.children{
                    let snap = snap as! DataSnapshot
                    let key = snap.key
                    self.keys.append(key)
                }
                self.keys.reverse()
            })
    }
}

extension ProfileViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Twetts")
    }

    
}

extension UIView{
    func addViews(_ view:[UIView]){
        for i in view{
            self.addSubview(i)
        }
    }
}


