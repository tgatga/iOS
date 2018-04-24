//
//  AboutUsViewController.swift
//  Sushi
//
//  Created by Nazhmeddin Babakhanov on 4/11/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography

class AboutUsViewController: UIViewController {

    lazy var  tableview:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        table.register(PersonalAreaCell.self, forCellReuseIdentifier: PersonalAreaCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.086, green:0.086, blue:0.086, alpha:1)
      
        self.title = "Ещё"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        setupTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Ещё"
    }
    
    func setupTable(){
        view.addSubview(tableview)
        
        constrain(tableview){ table in
            table.width == (table.superview?.width)!
            table.height == (table.superview?.height)!
            table.top == (table.superview?.top)! + 50
        }
        
    }
    

}

extension AboutUsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalAreaCell.identifier, for: indexPath) as! PersonalAreaCell
        cell.separatorInset = UIEdgeInsetsMake(20, 20, 20, 20);
        cell.titleLabel.text = Constant.nameYetsCont[indexPath.row]
        cell.imageView?.image = UIImage.init(named: Constant.nameYetsImage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}


