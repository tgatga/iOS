//
//  LoginViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import Cartography
import UIKit
class ProfileCell: UITableViewCell {
      let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    // MARK: - Properties
    lazy var imageI : UIView = {
        let i = UIView()
        i.backgroundColor = twitterColor
        i.layer.cornerRadius = 8
        return i
    }()
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Assel"
        name.font = UIFont.systemFont(ofSize: 16)
        name.textColor = UIColor(red: 0.647058823529412, green: 0.615686274509804, blue: 0.415686274509804, alpha: 1.0)
        name.lineBreakMode = .byWordWrapping
        return name
    }()
    lazy var nameUserLabel: UILabel = {
        let name = UILabel()
        name.text = "@mail.ru"
        name.font = UIFont.systemFont(ofSize: 12)
        name.textColor = .gray
        name.lineBreakMode = .byWordWrapping
        return name
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "News for everyone"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    lazy var hashtagLabel : UILabel = {
        let hashtag = UILabel()
        hashtag.text = "#"
        hashtag.font = UIFont.systemFont(ofSize: 16)
        hashtag.textColor = #colorLiteral(red: 0.4705882353, green: 0.6666666667, blue: 0.9098039216, alpha: 1)
        hashtag.textAlignment = .left
        return hashtag
    }()
    // MARK: - Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        layer.borderColor = UIColor(red: 0.949019607843137, green: 0.949019607843137, blue: 0.952941176470588, alpha: 1.0).cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 1
        // selected cell color
        selectionStyle = .blue
        let cellBGView = UIView()
        cellBGView.backgroundColor =  UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 0.1)
        selectedBackgroundView = cellBGView
        
        
        setupViews()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Inital Setup
    func setupViews() {
        [imageI,nameLabel,nameUserLabel, titleLabel,hashtagLabel].forEach { (view) in
            contentView.addSubview(view)
        }
    }
    // MARK: - Constraints
    func setupConstraints() {
        constrain(imageI,nameLabel,nameUserLabel,titleLabel,hashtagLabel){image,nameLabel,nameUserLabel,titleLabel,hashtagLabel in
            image.height == 16
            image.top == nameLabel.top
            image.left == (image.superview?.left)!+13
            
            nameLabel.width == (nameUserLabel.superview?.width)!/4
            nameLabel.centerX == nameUserLabel.centerX
            nameLabel.height == 20
            nameLabel.top == nameLabel.superview!.top+20
            nameLabel.left == (nameLabel.superview?.left)!+50
            
            nameUserLabel.width == (nameUserLabel.superview?.width)!/1.5
            nameUserLabel.top == nameLabel.top
            nameUserLabel.height == 20
            
            titleLabel.width ==  nameUserLabel.superview!.width/1.5
            titleLabel.left == nameLabel.left
            titleLabel.height == 40
            
            hashtagLabel.width ==  hashtagLabel.superview!.width/1.5
            hashtagLabel.height == 20
            hashtagLabel.left == nameLabel.left

            distribute(by: 5, vertically: nameLabel,titleLabel)
            distribute(by: 1, vertically: titleLabel,hashtagLabel)
            distribute(by: 20, horizontally: image, nameLabel,nameUserLabel)
            distribute(by: 1, horizontally:nameLabel,nameUserLabel)

        }
    }
}
