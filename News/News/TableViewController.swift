//
//  TableViewController.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
import Cartography
import TableFlip

protocol TableViewDelegate: class {
    func TableDidSelectRow(row: Int)
    var news:[NEWS]{get set}
}

class TableViewModule:UIView,UITableViewDelegate,UITableViewDataSource{
    weak var delegate: TableViewDelegate?
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        constrain(tableView){table in
            table.width == (table.superview?.width)!
            table.height == (table.superview?.height)!
            table.top == (table.superview?.top)!
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "myCell")
        tableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.TableDidSelectRow(row:  indexPath.row)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.delegate?.news.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NewsCell
        cell.titleLabel.text = delegate?.news[indexPath.row].title
        cell.dateLabel.text = delegate?.news[indexPath.row].date
        cell.imgView.downloadedFrom(link: (delegate?.news[indexPath.row].link)!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.news.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func reloadData(){
        tableView.reloadData()
    }
    func animate(animation:TableViewAnimation.Cell){
        tableView.animate(animation: TableViewAnimation.Cell.fade(duration: 1))
    }
}

class NewsCell:UITableViewCell{
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:58/255, green:120/255, blue:196/255, alpha:1)
        return label
    }()
    
    lazy var imgView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "image")
        return image
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView(){
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(imgView)
        constrain(titleLabel,dateLabel,imgView){lbl,l,img in
            img.height == (img.superview?.width)!/6
            img.width ==  (img.superview?.width)!/6
            img.left == (img.superview?.left)! + 20
            img.top == (img.superview?.top)! + 20
            img.bottom == img.bottom + 20
            
            lbl.height == (lbl.superview?.width)!/8
            lbl.top == (lbl.superview?.top)! + 20
            lbl.left == img.right + 20
            lbl.width == (lbl.superview?.width)!/1.5
            
            l.height == (lbl.superview?.width)!/12
            l.centerY == lbl.centerY
            l.left == lbl.left
            distribute(by: 2, vertically: lbl,l)  
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


