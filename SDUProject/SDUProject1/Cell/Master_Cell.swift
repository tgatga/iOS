//
//  TableViewCell.swift
//  SDU
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class Master_Cell: UITableViewCell {

    @IBOutlet weak var SelectionCellImage:UIImageView!
    @IBOutlet weak var SelectionCellLable: UILabel!
    
    @IBOutlet weak var WebCellImage: UIImageView!
    @IBOutlet weak var WebCellLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
