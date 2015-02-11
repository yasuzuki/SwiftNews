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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        var entry = entries[indexPath.row] as NSDictionary
        cell.textLabel?.text = entry["title"] as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: entries[indexPath.row])
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

