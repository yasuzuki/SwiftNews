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
    var entry = NSDictionary()
    
    @IBOutlet weak var webView: UIWebView!
    @IBAction func twitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let link = entry["link"] as String
            let url = NSURL(string: link)
            controller.addURL(url)
            let title = entry["title"] as String
            controller.setInitialText(title)
            presentViewController(controller, animated: true, completion: {})
            
        }
    }
    @IBAction func facebook(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: self.entry["link"] as String)!
        var request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
    }
    
}