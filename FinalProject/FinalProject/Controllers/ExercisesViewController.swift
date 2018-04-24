//
//  ExercisesViewController.swift
//  FinalProject
//
//  Created by I on 21.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
class ExercisesViewController: UIViewController {
    lazy var count = 21
    var index = 0
    lazy var timer = Timer()

    lazy var label:UILabel = {
        let label = UILabel.init()
        //label.textColor = UIColor.init(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
        label.textAlignment = .center
        label.frame = CGRect.init(x: 40, y: 40, width: 100, height: 30)
        label.text = "0"
        return label
    }()
    
    
    
    
    @IBAction func buttonStart(_ sender: UIButton) {
        sender.setTitle("Stop", for: .normal)
        label.textColor = UIColor.init(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
        count = 20
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(label)
        label.textColor = .white
        constrain(label){label in
            label.width == 100
            label.height == 100
            label.centerX == label.superview!.centerX
            label.bottom == label.superview!.bottom - self.view.bounds.width/3
        }
            timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(updateTime), userInfo: NSData(), repeats: true)
            timer.fire()
        
    }
    @objc func updateTime() -> Void {
        if(count==0){
            index+=1
            count = 21
            if 7 >= index {
                collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            }
            else{index=0}
            print(index)
        }
        if(count>0){
            
            count -= 1
            
            label.text = "\(count)"
        
        }
        
    }
    @IBAction func scrollHandler(_ sender: UIButton) {
        index+=1
        count = 21
        if 7 >= index {
            collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
        else{index=0}
        print(collectionView.visibleCells.count )
    }
}

extension ExercisesViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.exerciseCell, for: indexPath) as! ExerciseCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
}
