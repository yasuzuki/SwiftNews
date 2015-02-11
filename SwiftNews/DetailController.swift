//
//  DetailController.swift
//  SwiftNews
//
//  Created by yas on 2015/02/07.
//  Copyright (c) 2015年 yasuzuki. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var entry = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: self.entry["link"] as String)!
        var request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
    }
    
}