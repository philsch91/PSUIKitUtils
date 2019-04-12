//
//  PSButton.swift
//  MLChess
//
//  Created by Philipp Schunker on 11.04.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

import UIKit

public class PSButton: UIButton {
    
    var color: UIColor!
    var pressedColor: UIColor!
    
    override public var isHighlighted: Bool {
        willSet(newValue) {
            if(newValue) {
                //print("newValue true")
                self.backgroundColor = self.pressedColor
            } else {
                //print("newValue false")
                self.backgroundColor = self.color
            }
        }
        didSet(oldValue) {
            //print("isHighLighted",self.isHighlighted)
            //print("isSelected",self.isSelected)
            
            if(oldValue) {
                //print("oldValue true")
                self.backgroundColor = self.color
            } else {
                //print("oldValue false")
                self.backgroundColor = self.pressedColor
            }
            
            /*
            if self.isHighlighted {
                self.backgroundColor = self.color
            } else {
                self.backgroundColor = self.pressedColor
            }*/
        }
    }
    
    public init(color: UIColor, pressedColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.color = color
        self.pressedColor = pressedColor
        self.layer.backgroundColor = self.color.cgColor
        self.layer.cornerRadius = 5.0
    }
    
    public init(frame: CGRect, color: UIColor, pressedColor: UIColor) {
        super.init(frame: frame)
        self.color = color
        self.pressedColor = pressedColor
        self.layer.backgroundColor = self.color.cgColor
        self.layer.cornerRadius = 5.0
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
