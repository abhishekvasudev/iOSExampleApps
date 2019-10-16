//
//  ViewController.swift
//  DelegationExampleApp
//
//  Created by Abhishek Vasudev on 14/10/19.
//  Copyright © 2019 Abhishek Vasudev. All rights reserved.
//

// Employee Screen - Doesn't have information to work on, will ask Boss to get the information and work upon them.
// The delegate variable will be assigned to self, this viewController is assigning itself to be delegate for Boss. For this this viewController will adhere to the protocol as well

import UIKit

let redNotificationKey = "bundleID.red"
let brownNotificationKey = "bundleID.brown"


class ViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default

    @IBOutlet weak var displayLabel: UILabel!
    let redNotification = Notification.Name(rawValue: redNotificationKey)
    let brownNotification = Notification.Name(rawValue: brownNotificationKey)
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createObservers()
    }
    
    func createObservers(){
        //Example of multiple observers
        //Red observers
        notificationCenter.addObserver(self, selector: #selector(ViewController.updateBackgroundColor(notification:)), name: redNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ViewController.updateDisplayLabel(notification:)), name: redNotification, object: nil)
        //Brown observers
        notificationCenter.addObserver(self, selector: #selector(ViewController.updateBackgroundColor(notification:)), name: brownNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ViewController.updateDisplayLabel(notification:)), name: brownNotification, object: nil)
        
    }
    
    @objc func updateBackgroundColor(notification: NSNotification){
        let isRed = notification.name == redNotification
        view.backgroundColor = isRed ? UIColor.red : UIColor.brown
    }
    
    @objc func updateDisplayLabel(notification: NSNotification){
        let isRed = notification.name == redNotification
        let colorName = isRed ? "Red" : "Brown"
        displayLabel.text = "The color has changed to \(colorName)"
    }

    @IBAction func chooseColorAction(_ sender: Any) {
        let seclectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        present(seclectionVC, animated: true, completion: nil)
    }
    
}

