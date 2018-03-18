//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class Univer_Cell: UITableViewCell {
    
    @IBOutlet weak var blocks: UIImageView!
    @IBOutlet weak var block2: UIImageView!
    @IBOutlet weak var blockLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
