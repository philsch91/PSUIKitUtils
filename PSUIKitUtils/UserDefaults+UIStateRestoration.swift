//
//  UserDefaults+UIStateRestoration.swift
//  PSUIKitUtils
//
//  Created by Philipp Schunker on 04.10.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import Foundation

@objc
extension UserDefaults {

    open func setStateRestorationDebugging(_ value: Bool) -> Void {
        self.set(value, forKey: "UIStateRestorationDebugLogging")
        self.set(value, forKey: "UIStateRestorationDeveloperMode")
    }
}
