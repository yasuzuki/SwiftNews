//
//  ViewController.swift
//  SwiftNews
//
//  Created by yas on 2015/02/07.
//  Copyright (c) 2015年 yasuzuki. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let newsUrlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8"
    var entries = NSArray()

    
    @IBAction func refresh(sender: AnyObject) {
        var url = NSURL(string: newsUrlString)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            data, response, error in
            var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            if var responseData = dict["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSArray {
                        self.entries = entries
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let iphones = [
        "iPhone",
        "iPhone 3G",
        "iPhone 4",
        "iPhone 4S",
        "iPhone 5",
        "iPhone 5s",
        "iPhone 6",
        "iPhone 6 Plus"
    ]
    
    let years = [
        "2007",
        "2008",
        "2010",
        "2011",
        "2012",
        "2013",
        "2014",
        "2014"
    ]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        var entry = entries[indexPath.row] as NSDictionary
        cell.textLabel?.text = entry["title"] as? String
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

