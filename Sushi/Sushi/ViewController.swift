//
//  ViewController.swift
//  Sushi
//
//  Created by Nazhmeddin Babakhanov on 4/10/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography
import PMAlertController

class ViewController: UIViewController {
    
    lazy var  tableview:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        
       // table.allowsSelection = false
       // table.isUserInteractionEnabled = true
        table.register(PersonalAreaCell.self, forCellReuseIdentifier: PersonalAreaCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.086, green:0.086, blue:0.086, alpha:1)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title = "Личный кабинет"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        setupTable()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Личный кабинет"
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


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalAreaCell.identifier, for: indexPath) as! PersonalAreaCell
        cell.separatorInset = UIEdgeInsetsMake(20, 20, 20, 20);
        cell.titleLabel.text = Constant.namester[indexPath.row]
        cell.imageView?.image = UIImage.init(named: Constant.namesImage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 ||  indexPath.row == 1{
            let alertVC = PMAlertController(title: "Введите номер телефона", description: "", image: nil, style: .alert)
            
            alertVC.addTextField { (textField) in
                textField?.placeholder = "+777 777 77 77"
            }
            
            alertVC.addAction(PMAlertAction(title: "Получить код", style: .cancel, action: { () -> Void in
                print("Capture action Cancel")
            }))
            
            alertVC.addAction(PMAlertAction(title: "Пропустить", style: .default, action: { () in
                print("Capture action OK")
            }))
            
            
            
            self.present(alertVC, animated: true, completion: nil)
        }
        else{
            self.title = ""
            navigationController?.pushViewController(FeedbackController(), animated: true)
        }
//        let viewController =
//        if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell,
//            let image = cell.newsImageView.image {
//            viewController.newsImageView.image = image
//        }
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


