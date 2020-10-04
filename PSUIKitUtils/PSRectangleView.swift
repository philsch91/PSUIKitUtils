//
//  PSRectangleView.swift
//  PSUIKitUtils
//
//  Created by philipp on 19.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import UIKit
import CoreGraphics

open class PSRectangleView: UIView {
    
    open var strokeColor: UIColor!
    open var lineWidth: CGFloat = 0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    open override func draw(_ rect: CGRect) {
        // Drawing code
        let boundsRect: CGRect = self.bounds
        let context: CGContext! = UIGraphicsGetCurrentContext()
        
        // Draw background
        
        //CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
        //CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
        //CGContextSetFillColorWithColor(context, [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor);
        //CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);   //transparent color
        context.setFillColor(self.backgroundColor!.cgColor)
        
        //CGContextFillRect(context, boundsRect);
        context.fill(boundsRect)
        
        // Draw the window 'frame'
        
        if self.strokeColor == nil {
            self.strokeColor = UIColor.clear
        }
        
        //CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
        //CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
        context.setStrokeColor(self.strokeColor.cgColor)
        
        //CGContextSetLineWidth(context, self.lineWidth);
        context.setLineWidth(self.lineWidth)
        
        //CGContextStrokeRect(context, self.maskRect);
        //CGContextStrokeRect(context, boundsRect);    //draw the border
        context.stroke(boundsRect)

        // Make the window transparent
        //CGContextSetBlendMode(context, kCGBlendModeClear);
        //CGContextFillRect(context, self.maskRect);
        //CGContextFillRect(context, self.maskView.frame);
    }

}
