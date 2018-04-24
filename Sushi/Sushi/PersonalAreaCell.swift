//
//  PersonalAreaCell.swift
//  
//
//  Created by Nazhmeddin Babakhanov on 4/11/18.
//


import UIKit
import Cartography

class PersonalAreaCell:UITableViewCell {
    
//    
    // MARK: - Properties
    
    static var identifier: String {
        return "PersonalArea"
    }
    
    
    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
      //  imageView.kf.indicatorType = .activity
        //imageView.image = #imageLiteral(resourceName: "avatar")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
       // label.font = .sfProTextRegular(ofSize: 16)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var view1:UIView = {
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:0.764, green:0.764, blue:0.764, alpha:1)
        return view1
    }()
    // MARK: - Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Inital Setup
    func setupViews() {
        [foodImageView, titleLabel,view1].forEach { (view) in
            contentView.addSubview(view)
        }
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        constrain(foodImageView, titleLabel, contentView,view1) { newsImageView, titleLabel, contentView ,view1 in
            newsImageView.left == contentView.left + 10
            newsImageView.width == 50
            newsImageView.height == 50
            newsImageView.centerY == contentView.centerY
           
            
            view1.bottom == contentView.bottom
            view1.height == 1.2
            view1.width == (view1.superview?.width)!
            view1.right == (view1.superview?.right)!
            
            titleLabel.left == newsImageView.right + UIScreen.main.bounds.width/6
            //titleLabel.right == contentView.right - 36
            titleLabel.centerY == newsImageView.centerY
            
            
          
        }
       
        self.frame = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(10, 10, 10, 10))
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = .white
    }
}
