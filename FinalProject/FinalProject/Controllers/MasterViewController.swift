//
//  DetailViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
class MasterViewController: UIViewController {

    
    var isSlide = false
    
  
    @IBOutlet weak var exercises: UILabel!
    
    @IBOutlet weak var healthyfoodbutton: UIButton!
    @IBOutlet weak var statistics: UIButton!
    @IBOutlet weak var profil: UILabel!
    @IBOutlet weak var dayView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profilImg: UIImageView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var profilView: UIView!
    @IBOutlet weak var fitness: UIButton!
    @IBOutlet weak var rejim: UIButton!
    @IBOutlet weak var kenes: UIButton!
    

    @IBAction func SignOut(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var leftAnchor: NSLayoutConstraint!
    
    @IBAction func drop(_ sender: UIBarButtonItem) {
        if !isSlide {
            self.leftAnchor.constant = 300
            UIView.animate(withDuration: 0.7, animations: {
                 self.view.layoutIfNeeded()
            })
        }
        else{
            self.leftAnchor.constant = 0
            UIView.animate(withDuration: 0.7, animations: {
                 self.view.layoutIfNeeded()
            })
        }
        isSlide = !isSlide
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //sself.navigationController?.isNavigationBarHidden = true
        //self.navigationController?.navigationBar.alpha =  0
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        self.leftAnchor.constant = 0
        UIView.animate(withDuration: 0.05, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func setupViews() -> Void {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        exercises.text = "Бірге жаттығайық!"
        profilView.addSubview(blurEffectView)
        dayView.layer.cornerRadius = dayView.frame.height/2
       
        menuView.addSubview(fitness)
        menuView.addSubview(statistics)
        menuView.addSubview(rejim)
        menuView.addSubview(kenes)
        menuView.addSubview(profil)
        menuView.addSubview(profilImg)
        
        UIGraphicsBeginImageContext(mainView.frame.size)
        UIImage(named: "morning-1.jpg")?.draw(in: mainView.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        mainView.backgroundColor = UIColor(patternImage: image)
        
        healthyfoodbutton.layer.cornerRadius = healthyfoodbutton.frame.height/2
        fitness.titleLabel?.numberOfLines = 2
        fitness.addBorder(side: .Bottom, color: .gray, width: 1)
        statistics.addBorder(side: .Bottom, color: .gray, width: 1)
        rejim.addBorder(side: .Bottom, color: .gray, width: 1)
        kenes.addBorder(side: .Bottom, color: .gray, width: 1)
        profilImg.layer.cornerRadius = profilImg.frame.height/2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let info = segue.destination as? UINavigationController {
            if let destination = info.visibleViewController as? ExercisesViewController{print(destination)}
            if let destination = info.visibleViewController as? FoodViewController{print(destination)}
        }
    }
    
}
