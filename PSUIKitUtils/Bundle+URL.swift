//
//  Bundle+URL.swift
//  PSUIKitUtils
//
//  Created by Philipp Schunker on 20.07.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import Foundation

@objc
extension Bundle {
    
    open func isTestFlight() -> Bool {
        guard let appStoreReceiptURL = Bundle.main.appStoreReceiptURL else {
            return false
        }
        return appStoreReceiptURL.lastPathComponent == "sandboxReceipt"
    }
}
