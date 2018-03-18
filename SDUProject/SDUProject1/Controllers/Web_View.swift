//
//  PageTableViewController.swift
//  Assigment-4(WebBrowser)
//
//  Created by MacPro on 16.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class Web_View: UIViewController, UIWebViewDelegate {
    var index : Int?
    var delegate : Delegate?

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
        }
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.stopAnimating()
    }

}
