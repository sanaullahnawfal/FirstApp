//
//  OfferViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/22/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var offerLeaflet: UIWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://s3.amazonaws.com/online.fliphtml5.com/defk/qmty/index.html")
        let request = URLRequest(url: url!)
        offerLeaflet.loadRequest(request)
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loader.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
