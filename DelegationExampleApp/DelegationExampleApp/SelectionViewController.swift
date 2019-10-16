//
//  SelectionViewController.swift
//  DelegationExampleApp
//
//  Created by Abhishek Vasudev on 14/10/19.
//  Copyright © 2019 Abhishek Vasudev. All rights reserved.
//

// BOSS screen, knows all the information, so protocol will be designed here
// The delegate variable will be decalred here


import UIKit

//MARK: - ColorSelectionDelegate Protocl
protocol ColorSelectionDelegate {
    func didTapChoice(name: String, color: UIColor)
}

class SelectionViewController: UIViewController {
    
    // Declaring the delegate here
    var selectionDelegate: ColorSelectionDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redButtonClicked(_ sender: Any) {
        selectionDelegate.didTapChoice(name: "Red", color: UIColor.red)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brownButtonClicked(_ sender: Any) {
        selectionDelegate.didTapChoice(name: "Brown", color: UIColor.brown)
        dismiss(animated: true, completion: nil)
    }
}
