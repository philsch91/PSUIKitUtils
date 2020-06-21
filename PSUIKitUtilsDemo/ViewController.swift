//
//  ViewController.swift
//  PSUIKitUtilsDemo
//
//  Created by Philipp Schunker on 21.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import UIKit
import PSUIKitUtils

class ViewController: PSViewController {
    
    var squareView: PSRectangleView!
    var circleView: PSCircleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "PSUIKitUtilsDemo"
        self.view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.userDidTakeScreenshot(notification:)), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.proximityStateDidChange(notification:)), name: UIDevice.proximityStateDidChangeNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("self.view.window \(String(describing: self.view.window?.description))")
        
        let statusBarHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        print("statusBarHeight: \(statusBarHeight)")
        
        for subview in self.view.subviews {
            subview.center.y += CGFloat(statusBarHeight)
        }
    }
    
    func setupUI() -> Void {
        var offset: Float = 0
        
        /*
        if self.navigationController != nil {
            let navigationBar = self.navigationController!.navigationBar
            let navigationBarHeight: CGFloat = navigationBar.frame.size.height
            print(navigationBarHeight)
            offset = Float(navigationBarHeight)
        } */
        
        if let navigationController = self.navigationController {
            let navigationBar = navigationController.navigationBar
            let navigationBarHeight: CGFloat = navigationBar.frame.size.height
            print(navigationBarHeight)
            offset = Float(navigationBarHeight)
        }
        
        var square: CGRect = self.view.frame
        square.size.height = square.size.width
        square.origin.y += CGFloat(offset)
        
        let squareView = PSRectangleView(frame: square)
        squareView.lineWidth = 5.0
        squareView.strokeColor = UIColor.blue
        squareView.backgroundColor = UIColor.clear
        self.squareView = squareView;
        
        self.view.addSubview(squareView)
        
        let circleView = PSCircleView(frame: square)
        circleView.lineWidth = 5.0
        circleView.strokeColor = UIColor.blue
        circleView.backgroundColor = UIColor.clear
        self.circleView = circleView;
        
        self.view.addSubview(self.circleView)
    }
    
    //MARK: - Notifications
    
    override func appDidEnterBackground(notification: Notification) {
        print("appDidEnterBackground")
    }
    
    override func appWillEnterForeground(notification: Notification) {
        print("appWillEnterForeground")
    }
    
    override func keyboardWillHide(notification: Notification) {
        print("keyboardWillHide")
    }
    
    override func keyboardWillShow(notification: Notification) {
        print("keyboardWillShow")
    }
    
    @objc open func userDidTakeScreenshot(notification: Notification) -> Void {
        print("userDidTakeScreenshot")
    }
    
    @objc open func proximityStateDidChange(notification: Notification) -> Void {
        print("proximityStateDidChange")
        
        let proximityState = UIDevice.current.proximityState
        print("proximityState is \(proximityState)")
    }

}

