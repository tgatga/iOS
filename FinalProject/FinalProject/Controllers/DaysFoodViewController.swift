//
//  DaysFoodViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class DaysFoodViewController: UIViewController {

    
    @IBOutlet weak var partOfDay: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Sunday","Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension DaysFoodViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.daysFoodCell, for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
