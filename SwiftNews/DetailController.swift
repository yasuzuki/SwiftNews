//
//  DetailController.swift
//  SwiftNews
//
//  Created by yas on 2015/02/07.
//  Copyright (c) 2015年 yasuzuki. All rights reserved.
//

import UIKit
import Social

class DetailController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBAction func twitter(sender: AnyObject) {
    }
    @IBAction func facebook(sender: AnyObject) {
    }
    
    var entry = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: self.entry["link"] as String)!
        var request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
    }
    
}