//
//  UIImage+UILabel.swift
//  PSUIKitUtils
//
//  Created by Philipp Schunker on 06.06.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    class func imageWithLabel(label: UILabel) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
