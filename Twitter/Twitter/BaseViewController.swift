//
//  LoginViewController.swift
//  Twitter
//
//  Created by Assel Tolebayeva on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import XLPagerTabStrip
class BaseViewController: TwitterPagerTabStripViewController {
    
    // MARK: - Properties
    var isReload = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - TwitterPagerTabStripViewController methods
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = ProfileViewController()
        let child_2 = OneViewController()
        
        guard isReload else {
            return [child_1, child_2]
        }
        
        var childViewControllers = [child_1, child_2]
        
        for index in childViewControllers.indices {
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index {
                childViewControllers.swapAt(index, n)
            }
        }
        let nItems = 1 + (arc4random() % 8)
        return Array(childViewControllers.prefix(Int(nItems)))
    }
}
