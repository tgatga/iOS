//
//  TableViewController.swift
//  Animation
//
//  Created by Assel Tolebayeva on 01.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import TableFlip

class TableViewController: UITableViewController {
    
    let gadgets : [Gadgets] =  [Gadgets(name: "iPhone 7 Plus" , price: "$350", detail: "Snapdragon 808" , camera: "16MPX"),
                                Gadgets(name: "iPhone 7 Plus" , price: "$350", detail: "Snapdragon 808" , camera: "16MPX"),
                                Gadgets(name: "iPhone 7 Plus" , price: "$350", detail: "Snapdragon 808" , camera: "16MPX"),
                                Gadgets(name: "iPhone 7 Plus" , price: "$350", detail: "Snapdragon 808" , camera: "16MPX")]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(GadgetsViewCell.self, forCellReuseIdentifier: "myCell")
        tableView.separatorStyle = .none
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        tableView.animate(animation: TableViewAnimation.Cell.left(duration: 2))
       
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gadgets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! GadgetsViewCell
    
        cell.gadgetName.text = gadgets[indexPath.row].Name
        cell.gadgetPrice.text = gadgets[indexPath.row].Price
        cell.detail.text = gadgets[indexPath.row].Detail
        cell.camera.text = gadgets[indexPath.row].Camera
        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
       print("asds")
        
        (tableView.visibleCells[indexPath.row] as! GadgetsViewCell).accessoryType = .none
        UIView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromRight, animations: {

            (tableView.visibleCells[indexPath.row] as! GadgetsViewCell).view2.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
        }) { (success) in
            //(tableView.visibleCells[indexPath.row] as! GadgetsViewCell).view1.isHidden = true
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
