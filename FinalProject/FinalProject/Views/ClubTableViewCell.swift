//
//  ClubTableViewCell.swift
//  FinalProject
//
//  Created by I on 22.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ClubTableViewCell: UITableViewCell {

    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clip: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
