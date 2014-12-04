//
//  ViewController.swift
//  Tinder
//
//  Created by Ronald K Burnam on 11/30/14.
//  Copyright (c) 2014 RKB_Udemy. All rights reserved.
//

import UIKit

var answer: NSArray = []
var count = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loginCancelled: UILabel!
    
    @IBAction func signIn(sender: AnyObject) {
        
// Twitter login code
        PFTwitterUtils.logInWithBlock {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
//              Make the "unsuccessful" label appear if Twitter login was rejected
                self.loginCancelled.alpha = 1
            } else {
                
//              Parse login successful
                if PFUser.currentUser() != nil {
                    
//                  Connect to Parse login
                    Parse.setApplicationId("ARAyn4m8Wc35xurmwpiQ6LptXJipNP9vHNdQxroO", clientKey:"vxakJnFd7oHK1zN93PEw2pqFoLYO9cdFekRy112i")
                    
//                  Retrieve array of car names from Parse
                    var query = PFQuery(className: "cars")
                    query.getObjectInBackgroundWithId("LfaXlmFUom") {
                        (cars: PFObject!, error: NSError!) -> Void in

//                      If query successful, Segue to second View Controller to display list
                        if error == nil {
                            self.performSegueWithIdentifier("printList", sender: self)
                            answer = cars.objectForKey("cars") as NSArray
                            
                        } else {
                            println(error)
                        }
                    }
                    
                }
            }

            // This was the code for populating the array in Parse
            //  }
                //                var cars = PFObject(className: "cars")
                //                cars.setObject(["Ford", "Chevrolet", "Subaru", "Dodge", "Cadillac"], forKey: "cars")
                //                cars.saveInBackgroundWithBlock {
                //                    (succeed: Bool!, error: NSError!) -> Void in
                //                    if (error != nil) {
                //                        println("Save: \(error)")
                //                    } else {
                //                        println("Success! with save")
                //                    }
                
                
        

        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = answer[indexPath.row] as NSString
        return cell
    }

}

