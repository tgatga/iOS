//
//  GadgetsViewCell.swift
//  Animation
//
//  Created by Assel Tolebayeva on 03.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class GadgetsViewCell: UITableViewCell {

    lazy var gadgetName : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 25)
        return l
    }()
    
    lazy var gadgetPrice : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
 
    lazy var detail :UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    lazy var camera:UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    lazy var buttonHide : UIButton = {
        let b = UIButton()
        b.setTitle("hide", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.layer.borderWidth = 1.0
        b.layer.cornerRadius = 5
        b.layer.borderColor = UIColor.white.cgColor
        b.addTarget(self, action: #selector(self.changeButton), for: .touchUpInside)
        b.setTitleColor(.white, for: .normal)
        return b
    }()
    
    @objc func changeButton(){
        print(124)
        UIView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromRight, animations: {
           //self.view2.layer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi/2), 0, 1, 0)
        }) { (success) in
           self.view1.isHidden = false
            self.view2.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi/2), 0, 1, 0)
            self.accessoryType = .detailButton
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    var view1 = UIView()
    var view2 = UIView()
    
    func setup() {
        view1.addSubview(gadgetName)
        view1.addSubview(gadgetPrice)
        addSubview(view1)
       
        constrain(gadgetName,gadgetPrice,view1){gn,gp,v1 in
            gn.left == (gn.superview?.left)! + 20
            gn.top == (gn.superview?.top)! + 10
            gn.width == (gn.superview?.width)!/2.1
            gn.height == 40
            
            gp.left == gn.left
            gp.width ==  gn.width
            gp.height == gn.height
            gp.bottom == (gp.superview?.bottom)!
            
            v1.width == (v1.superview?.width)!
         
            distribute(by: 2, vertically: gn,gp)
        }
        
        view2.addSubview(detail)
        view2.addSubview(camera)
        view2.addSubview(buttonHide)
        addSubview(view2)
        
        constrain(detail,camera,buttonHide,view2){tn,cl,bh,v2 in
            tn.left == (tn.superview?.left)! + 50
            tn.top == (tn.superview?.top)! + 10
            tn.width == (tn.superview?.width)!/2.1
            tn.height == 40
            
            cl.left == tn.left
            cl.width ==  tn.width
            cl.height == tn.height
            cl.bottom == (cl.superview?.bottom)!
            
            bh.right == (bh.superview?.right)! - 50
            bh.width == 100
            bh.height == 40
            bh.centerY == (bh.superview?.centerY)!
            
            v2.width == (v2.superview?.width)!
            
            distribute(by: 2, vertically:tn,cl)
        }
        
        view2.backgroundColor =  UIColor(displayP3Red: 211/255, green: 173/255, blue: 158/255, alpha: 1)
        view2.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi/2), 0, 1, 0)
        self.accessoryType = .detailButton
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
