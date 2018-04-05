//
//  PageTableViewController.swift
//  Assigment-4(WebBrowser)
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class PageTableViewController: UIViewController, UIWebViewDelegate {
    var index : Int?
    var delegate : Delegate?
    
    @IBAction func AddFavourite(_ sender: UITapGestureRecognizer) {
        delegate!.websites[index!].IsChecked = !delegate!.websites[index!].IsChecked!
        change()
    }
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myIndicator.isHidden = true
        if let address = delegate{
            myIndicator.isHidden = false
            let site_url = URL(string: address.websites[index!].BrowserUrl!)
            myIndicator.startAnimating()
            webView.loadRequest(URLRequest(url: site_url!))
            navigationItem.title = address.websites[index!].Title
            change()
        }
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.stopAnimating()
    }
    func change() -> Void {
        let b : Bool =  delegate!.websites[index!].IsChecked!
        if b == true {
            self.view.backgroundColor = UIColor.red
        }
        else{
            self.view.backgroundColor = UIColor.white
        }
    }
}
