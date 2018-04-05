//
//  WebsitesTableViewController.swift
//  Assigment-4(WebBrowser)
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//
import UIKit

protocol Delegate {
    var websites:[Website]{get set}
}
class WebsitesTableViewController: UITableViewController,Delegate {
    
    var favourite = [Website]()
    
    var websites : [Website] = [
        Website.init("Google", "http://google.com", false),
        Website.init("Instagram", "https://instagram.com", false),
        Website.init("VKontakte", "https://vk.com", false),
        Website.init("Facebook", "https://facebook.com", false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        favourite = websites
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    @IBOutlet weak var Controller: UISegmentedControl!
    @IBAction func SegmentControl(_ sender: AnyObject) {
        
        if Controller.selectedSegmentIndex == 1{
            print("1")
            favourite = websites.filter({$0.IsChecked == true})
            self.tableView.reloadData()
        }
        else{
            favourite = websites
        }
        tableView.reloadData()
    }
    @IBAction func AddWebsite(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Enter Title?", message: "Enter url", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            
            let web_title = alertController.textFields?[0].text
            let web_url = alertController.textFields?[1].text
            if (web_title?.count)! > 0 && (web_url?.count)! > 0 {
                self.favourite.append(Website.init(web_title!, web_url!, false))
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }

        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Title"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Url"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return favourite.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! WebsiteTableViewCell
        cell.websiteName.text = favourite[indexPath.row].Title
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let nav = segue.destination as? UINavigationController{
                if let destination = nav.visibleViewController as? PageTableViewController{
                    destination.index = tableView.indexPathForSelectedRow?.row
                    destination.delegate = self as Delegate
                    
                }
            }
        }
    }
}
