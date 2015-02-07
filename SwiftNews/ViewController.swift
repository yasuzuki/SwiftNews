//
//  ViewController.swift
//  SwiftNews
//
//  Created by yas on 2015/02/07.
//  Copyright (c) 2015年 yasuzuki. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

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
        return iphones.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "news")
        cell.textLabel?.text = iphones[indexPath.row]
        cell.detailTextLabel?.text = years[indexPath.row]
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

