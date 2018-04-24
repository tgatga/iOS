//
//  HomeController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 11.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class WordCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    lazy var label : UILabel = {
        let l = UILabel()
        l.text = "Hi"
        return l
    }()
    func setupViews(){
        backgroundColor = .yellow
        addSubview(label)
        
        constrain(label) { (l) in
            l.top == (l.superview?.top)!
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        self.collectionView!.register(WordCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    
}
