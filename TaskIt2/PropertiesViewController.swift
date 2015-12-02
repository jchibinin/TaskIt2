//
//  PropertiesViewController.swift
//  TaskIt2
//
//  Created by Yakov on 02/11/15.
//  Copyright © 2015 Bitfoundation. All rights reserved.
//

import UIKit
import CoreData

class PropertiesViewController: UIViewController {

    var mainVC: ViewController!
    
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBOutlet weak var finishSwitch: UISwitch!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.finishSwitch.on = mainVC.notificationFinish
        
        if mainVC.from {
           segmentControl.selectedSegmentIndex = 0
           self.dueDate.date = mainVC.timeBegin
        } else {
            segmentControl.selectedSegmentIndex = 1
            self.dueDate.date = mainVC.timeEnd
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func doneTapped(sender: UIButton) {
        
     
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            mainVC.from = true
            mainVC.timeBegin = self.dueDate.date
        case 1:
            mainVC.from = false
            mainVC.timeEnd = self.dueDate.date
        default:
            break; 
        }
       
        mainVC.notificationFinish = self.finishSwitch.on
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    //shedule actions
    
   
    @IBAction func setCurrentTimeTapped(sender: UIButton) {
        dueDate.date = NSDate.init()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
