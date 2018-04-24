//
//  MasterViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profile: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.profillCell, for: indexPath)
    }
}
