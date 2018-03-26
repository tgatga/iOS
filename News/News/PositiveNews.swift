//
//  PositiveNews.swift
//  News
//
//  Created by Assel Tolebayeva on 20.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import XLPagerTabStrip
import Cartography
import TableFlip
protocol IndicatorDelegate{
    var activityView: NVActivityIndicatorView {get set}
}
class PositiveNews: UIViewController,IndicatorInfoProvider,TableViewDelegate,CellDelegate{
    var information: NEWS = NEWS.init("", "", "", "", "")
    var delegateIndicat:IndicatorDelegate?
    var tableView: TableViewModule!
    var news = [NEWS]()
    func TableDidSelectRow(row: Int) {
        let nnews = NewsViewController()
        information = news[row]
        nnews.delegateCell = self
        self.show(nnews , sender: true)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Positive News")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = TableViewModule.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        tableView.delegate = self
        view.addSubview(tableView)
        view.backgroundColor = .white
        let api = APIManager.sharedInstance.fetchPositiveNewsFromApi(api: "pos")
        news = api
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.delegateIndicat?.activityView.stopAnimating()
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        self.tableView.animate(animation: TableViewAnimation.Cell.fade(duration: 1))
    }
}
