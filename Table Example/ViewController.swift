//
//  ViewController.swift
//  Table Example
//
//  Created by Jill Lopez on 11/1/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var quizTitles : [String] = ["Mathematics", "Marvel Superheros", "Science"]
    var quizSubtitle : [String] = ["A quiz on simple math in addition, subtraction, multiplication, and division", "A quiz on Marvel's superheroes", "A quiz on scienc-y stuff"]

    
    var quizImage : [UIImage] = [
        (UIImage(named: "calc.png"))!,
        (UIImage(named: "superhero.png"))!,
        (UIImage(named: "science.png"))!
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTitles.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = quizTitles[indexPath.row]
        cell.detailTextLabel?.text = quizSubtitle[indexPath.row]
        cell.imageView?.image = quizImage[indexPath.row]
        
        return cell
    }
    
    @IBAction func settingsAlert(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Settings", message:
            "Settings Go Here!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Cancel,handler: nil))
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))

        self.presentViewController(alertController, animated: true, completion: nil)
    }
 
}

