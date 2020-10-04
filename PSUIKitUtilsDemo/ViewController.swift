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
    
    // Stored property mainButton without initial value prevents synthesized initializers
    var squareView: PSRectangleView!
    var circleView: PSCircleView!
    var mainButton: PSButton!
    var secondaryButton: PSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "PSUIKitUtilsDemo"
        self.view.backgroundColor = UIColor.white
        self.setupUI()

        UserDefaults.standard.setStateRestorationDebugging(true)
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

        let mainButton = PSButton()
        mainButton.frame = CGRect(x: self.view.frame.size.width / 2 - (82 / 2), y: square.origin.y, width: 82, height: 38)
        mainButton.center.y += self.squareView.frame.size.height + 10
        mainButton.setTitle("Button 1", for: UIControl.State.normal)
        mainButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        self.mainButton = mainButton

        self.view.addSubview(self.mainButton)

        let secondaryButton = PSButton(frame: CGRect(origin: CGPoint(), size: CGSize(width: 82, height: 38)), color: UIColor.systemGreen, pressedColor: UIColor.green)
        secondaryButton.center.x = self.view.center.x
        print(secondaryButton.center.y) // = height/2
        secondaryButton.center.y *= 2
        secondaryButton.center.y += self.mainButton.center.y + 10
        secondaryButton.setTitle("Button 2", for: UIControl.State.normal)
        secondaryButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        self.secondaryButton = secondaryButton

        self.view.addSubview(self.secondaryButton)
    }

    @objc func buttonTapped(_ sender: UIButton) -> Void {
        print(sender)
        if let title = sender.title(for: UIControl.State.normal) {
            print(title)
        }
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

