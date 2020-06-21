//
//  PSCircleView.swift
//  PSUIKitUtils
//
//  Created by philipp on 19.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import UIKit

open class PSCircleView: UIView {
    
    open var strokeColor: UIColor! = UIColor.clear
    open var lineWidth: CGFloat = 0
    
    override public init(frame: CGRect) {
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
    override open func draw(_ rect: CGRect) {
        // Drawing code
        
        var boundsRect: CGRect = rect
        
        /// CoreGraphics ObjC
        /*
        CGRect boundsRect = self.bounds;
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //CGPoint center;
        //center.x = boundsRect.origin.x + boundsRect.size.width / 2.0;
        //center.y = boundsRect.origin.y + boundsRect.size.height / 2.0;
        //CGContextSaveGState(context);
        CGContextSetLineWidth(context, 10);
        CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
        //CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
        
        CGContextAddArc(context, self.center.x, self.center.y, round(self.frame.size.width) - 10, 0.0, M_PI*2, 1);
        CGContextStrokePath(context);
        */
        
        /// CoreGraphics Swift
        /*
        let context = UIGraphicsGetCurrentContext()
        let center = self.center
        let radius = (round(self.frame.size.width) - 10)
        context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI*2.0), clockwise: true)
        */
        
        if self.strokeColor == nil {
            self.strokeColor = UIColor.clear
        }
        
        self.strokeColor.setStroke()
        //UIColor.clear.setFill()
        self.backgroundColor?.setFill()
        
        print("rect.size.width: \(boundsRect.size.width.description)")
        print("rect.size.height: \(boundsRect.size.height.description)")
        
        boundsRect.size.width -= self.lineWidth
        boundsRect.size.height -= self.lineWidth
        
        print("rect.size.width: \(boundsRect.size.width.description)")
        print("rect.size.height: \(boundsRect.size.height.description)")
        
        let path = UIBezierPath(ovalIn: boundsRect)
        path.lineWidth = self.lineWidth
        path.stroke()
        path.fill()
    }

}
