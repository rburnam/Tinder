//
//  DisplayListViewController.swift
//  Tinder
//
//  Created by Ronald K Burnam on 12/3/14.
//  Copyright (c) 2014 RKB_Udemy. All rights reserved.
//

import UIKit

class DisplayListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listDisplay: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//      Make list length the same as the retrieved array length
        return answer.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

//      Create a UITableViewCell and display the array contents
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = answer[indexPath.row] as NSString
        return cell
    }

}
