//
//  ViewController.swift
//  Table Example
//
//  Created by Jill Lopez on 11/1/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

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
    
    
    var selectedTitle : String = ""
    
    /* Quizes */
    var mathQuiz = ["Mathematics", "What is 2+2", "3", "4", "5", "6", "4"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
        
        //self.tableView.estimatedRowHeight = 50
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // return how many sections are in table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //creates the number of rows/cells needed
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTitles.count
    }
    
    //creates the title, subtitle, and image for each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = quizTitles[indexPath.row]
        cell.detailTextLabel?.text = quizSubtitle[indexPath.row]
        cell.imageView?.image = quizImage[indexPath.row]
        
        return cell
    }
    
    //alert for settings
    @IBAction func settingsAlert(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Settings", message: "Settings Go Here!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //row Height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            //return indexPath.row == 0 ? 120 : 70
            return 70
    }
    
    //gets the cell that was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.selectedTitle = (cell?.textLabel?.text)!
        self.performSegueWithIdentifier("GameSegue", sender: nil)
    }
    
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       /* if selectedTitle == "Mathematics" {
            if let gameController = segue.destinationViewController as? GameView {
                gameController.selectedQuiz = "Mathematics"
            }
        }
        
        if selectedTitle == "Marvel Superheroes" {
            if let gameController = segue.destinationViewController as? GameView {
                gameController.selectedQuiz = "Marvel Superheroes"
            }
        }
        
        if selectedTitle == "Science" {
            if let gameController = segue.destinationViewController as? GameView {
                gameController.selectedQuiz = "Science"
            }
        }*/
        
        if let gameController = segue.destinationViewController as? GameView {
            gameController.selectedQuiz = selectedTitle
        }
        
    }
    
    
}