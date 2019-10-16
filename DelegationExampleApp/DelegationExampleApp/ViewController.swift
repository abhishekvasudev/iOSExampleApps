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

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseColorAction(_ sender: Any) {
        let seclectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        //Assigning the delegate to self
        seclectionVC.selectionDelegate = self
        present(seclectionVC, animated: true, completion: nil)
    }
    
}

//MARK: - Adhering to ColorSelectionDelegate Protocol
extension ViewController: ColorSelectionDelegate {
    func didTapChoice(name: String, color: UIColor) {
        displayLabel.text = "The background color changed to \(name)!"
        view.backgroundColor = color
    }
    
    
}

