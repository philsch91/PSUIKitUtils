//
//  UIApplication+SafariViewController.swift
//  PSUIKitUtils
//
//  Created by philipp on 19.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import UIKit
import SafariServices

extension UIApplication {
    
    open func openUrlInSafariVC(_ url: URL, from viewController: UIViewController? = nil) {
        let safariViewController = SFSafariViewController(url: url)
        if let appDelegate = UIApplication.shared.delegate {
            let viewController = viewController ?? appDelegate.window??.rootViewController
            if let presentingViewController = viewController {
                presentingViewController.present(safariViewController, animated: true, completion: nil)
            }
        }
    }
}
