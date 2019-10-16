//
//  ViewController.swift
//  PanGestureExampleApp
//
//  Created by Abhishek Vasudev on 11/10/19.
//  Copyright © 2019 Abhishek Vasudev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var documentImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var documentViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPanGesture(view: documentImageView)
        documentViewOrigin = documentImageView.frame.origin
        view.bringSubviewToFront(documentImageView)
    }
    
    //MARK: - Add PanGestureRecognizer
    func addPanGesture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePanGesture(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    //MARK: - Handle Pan Gesture Events
    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        let documentView = sender.view!
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(documentView: documentView, sender: sender)
            break
        case .ended:
            if documentView.frame.intersects(trashImageView.frame) {
                deleteView(view: documentView)
            } else {
                returnViewToOrigin(documentView: documentView)
            }
            break
        default:
            break
        }
    }
    
    //MARK: - Move View with pan gesture events
    func moveViewWithPan(documentView:UIView, sender: UIPanGestureRecognizer){
         let translation = sender.translation(in: view)
        documentView.center = CGPoint(x: documentView.center.x + translation.x, y: documentView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    //MARK: - Return the view to origin
    func returnViewToOrigin(documentView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            documentView.frame.origin = self.documentViewOrigin
        })
    }
    
    //MARK: - Remove the view from screen
    func deleteView(view: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            view.alpha = 0.0
        })
    }


}

