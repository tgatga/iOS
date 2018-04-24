//
//  DietaTableViewCell.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var partOfDay: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
