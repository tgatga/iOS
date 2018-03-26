//
//  NewsViewController.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation

import UIKit
import Cartography
import ParallaxHeader
import BulletinBoard

protocol CellDelegate {
    var information:NEWS{get set}
}

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OneNewsCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var buttonBottom:UIButton = {
        let button = UIButton.init()
        button.setTitle("Report an error", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red:151/255, green:134/255, blue:183/255, alpha:1)
        button.addTarget(self, action: #selector(showBulletion), for: .touchUpInside)
        return button
    }()
    
    lazy var bulletinManager: BulletinManager = {
        let page = PageBulletinItem(title: "Report an error")
        
        let greenColor = UIColor(red: 0.294, green: 0.85, blue: 0.392, alpha: 1)
//        page.appearance.actionButtonColor = greenColor
//        page.appearance.alternativeButtonColor = greenColor
//        page.appearance.actionButtonTitleColor = .white
//        
        page.image = #imageLiteral(resourceName: "wrong")
        page.descriptionText = "If a news musclassified you can sent a report"
        page.actionButtonTitle = "Send"
        page.alternativeButtonTitle = "Cancel"
        
        let nextpage = PageBulletinItem(title: "Push Notifications")
        nextpage.image = #imageLiteral(resourceName: "correct")
        
        nextpage.descriptionText = "Success"
        nextpage.actionButtonTitle = "Dismiss"
        page.actionHandler = { (item: PageBulletinItem) in
            item.manager?.displayActivityIndicator()
            item.manager?.displayActivityIndicator()
            item.manager?.push(item: nextpage)
        }
        
        page.alternativeHandler = { (item: PageBulletinItem) in
            item.manager?.displayActivityIndicator()
            item.manager?.dismissBulletin(animated: true)
        }
        
        nextpage.actionHandler = { (item: PageBulletinItem) in
            item.manager?.displayActivityIndicator()
            item.manager?.dismissBulletin(animated: true)
        }
        
        return BulletinManager(rootItem: page)
    }()
    
    @objc func showBulletion(){
        bulletinManager.prepare()
        bulletinManager.presentBulletin(above: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "News"
        setup()
    }
    
    var delegateCell:CellDelegate?
    func setup(){
        view.addSubview(tableView)
        view.addSubview(buttonBottom)
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "image")
        imageView.clipsToBounds = true
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.downloadedFrom(link: (delegateCell?.information.link)!)
        imageView.contentMode = .scaleAspectFill
        
        
        tableView.parallaxHeader.view = imageView
        tableView.parallaxHeader.height = 350
        tableView.parallaxHeader.minimumHeight = 20
        tableView.parallaxHeader.mode = .centerFill
        
        constrain(tableView,buttonBottom){ t,bb in
            t.height == (t.superview?.height)!
            t.width == (t.superview?.width)!
            t.top == (t.superview?.top)!
            bb.width == (bb.superview?.width)!
            bb.height == (bb.superview?.width)!/8
            bb.bottom == (bb.superview?.bottom)!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OneNewsCell
        cell.dataLabel.text = (delegateCell?.information.date)! + " /"
        cell.titleLabel.text = delegateCell?.information.title
        cell.shortTextView.text = delegateCell?.information.short_info
        cell.discriptionTextView.text = delegateCell?.information.description
        return cell
    }
}

class OneNewsCell:UITableViewCell{
    
    lazy var dataLabel:UILabel={
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "no"
        label.textColor = UIColor(red:0.897, green:0.898, blue:0.897, alpha:1)
        return label
    }()
    
    lazy var siteLabel:UILabel={
        let label = UILabel.init()
        label.text = "bnews.com"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red:0.31, green:0.614, blue:0.884, alpha:1)
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    lazy var shortTextView:UITextView = {
        let text = UITextView()
        text.text =  "No"
        text.font = UIFont(name: "Helvetica Neue" , size: 17)
        text.textAlignment = NSTextAlignment.justified
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isScrollEnabled = false
        text.isUserInteractionEnabled = false
        return text
    }()
    
    lazy var viewLine:UIView = {
        let viewLine = UIView.init()
        viewLine.backgroundColor = UIColor(red:0.897, green:0.898, blue:0.897, alpha:1)
        return viewLine
    }()
    
    lazy var discriptionTextView:UITextView = {
        let text = UITextView()
        text.text =  "No"
        text.font = UIFont(name: "Helvetica Neue" , size: 17)
        text.textAlignment = NSTextAlignment.justified
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isScrollEnabled = false
        text.isUserInteractionEnabled = false
        return text
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
        addSubview(dataLabel)
        addSubview(siteLabel)
        addSubview(titleLabel)
        addSubview(shortTextView)
        addSubview(viewLine)
        addSubview(discriptionTextView)
        self.isUserInteractionEnabled = false

        constrain(dataLabel,siteLabel,titleLabel,shortTextView,viewLine,discriptionTextView){data,site,title,short,viewLine,distext in
            data.left == (data.superview?.left)! + 20
            data.top == (data.superview?.top)! + 20
            data.width == (data.superview?.width)!/3
            data.height == (data.superview?.width)!/8
            
            site.width == (site.superview?.width)!/5
            site.height == data.height
            site.centerY == data.centerY
            
            
            title.height == (title.superview?.width)!/8
            title.left == data.left
            title.width == (title.superview?.width)! - 50
            title.centerX == (title.superview?.centerX)!
            
            short.width == title.width
            short.centerX == title.centerX
            
            viewLine.centerX == title.centerX
            viewLine.width == (viewLine.superview?.width)!/1.5
            viewLine.height == 2
            
            distext.width == title.width
            distext.centerX == title.centerX
            distext.bottom == (distext.superview?.bottom)! - 60
            
            distribute(by: 5, horizontally: data,site)
            distribute(by: 10, vertically:  data,title,short)
            distribute(by: 5, vertically: short,viewLine,distext)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
