//
//  NegativeNews.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Cartography
import XLPagerTabStrip
import TableFlip
class NegativeNews: UIViewController ,IndicatorInfoProvider,TableViewDelegate,CellDelegate{
    var information: NEWS = NEWS.init("", "", "", "", "")
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Negative News")
    }
    var delegateIndicat:IndicatorDelegate?
    var tableView: TableViewModule!
    var news = [NEWS]()
    func TableDidSelectRow(row: Int) {
        let nnews = NewsViewController()
        information = news[row]
        nnews.delegateCell = self
        self.show(nnews , sender: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView = TableViewModule.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        tableView.delegate = self
        view.addSubview(tableView)
        
        view.backgroundColor = .white
        let api = APIManager.sharedInstance.fetchPositiveNewsFromApi(api: "neg")
        news = api
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        self.tableView.animate(animation: TableViewAnimation.Cell.fade(duration: 1))
    }
}

