//
//  SelectionViewController.swift
//  DelegationExampleApp
//
//  Created by Abhishek Vasudev on 14/10/19.
//  Copyright © 2019 Abhishek Vasudev. All rights reserved.
//



import UIKit


class SelectionViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redButtonClicked(_ sender: Any) {
        let name = Notification.Name(rawValue: redNotificationKey)
        notificationCenter.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brownButtonClicked(_ sender: Any) {
        let name = Notification.Name(rawValue: brownNotificationKey)
        notificationCenter.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
