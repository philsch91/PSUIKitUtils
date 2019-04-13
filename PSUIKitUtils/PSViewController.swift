//
//  PSViewController.swift
//  PSUIKitUtils
//
//  Created by Philipp Schunker on 12.04.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

import UIKit

open class PSViewController: UIViewController {
    
    open var notificationObservers: [Notification] = [Notification]()

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.appDidEnterBackground(notification:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.appWillEnterForeground(notification:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIApplication.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIApplication.keyboardWillShowNotification, object: nil)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        for notification in self.notificationObservers {
            center.removeObserver(notification)
        }
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        for notification in self.notificationObservers {
            center.removeObserver(notification)
        }
    }
    
    // MARK: - Notifications
    
    @objc open func appDidEnterBackground(notification: Notification) -> Void {
    }
    
    @objc open func appWillEnterForeground(notification: Notification) -> Void {
    }
    
    @objc open func keyboardWillShow(notification: Notification) -> Void {
    }
    
    @objc open func keyboardWillHide(notification: Notification) -> Void {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - deinit
    
    deinit {
        //If your app targets iOS 9.0 and later or macOS 10.11 and later, you don't need to unregister an observer in its dealloc method.
        //https://developer.apple.com/documentation/foundation/nsnotificationcenter/1413994-removeobserver?language=objc
        //https://developer.apple.com/library/archive/releasenotes/Foundation/RN-FoundationOlderNotes/index.html#X10_11Notes
        //center.removeObserver(self)
    }

}
