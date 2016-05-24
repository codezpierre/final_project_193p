//
//  DoodleView.swift
//  FinalProject
//
//  Created by robbes on 5/23/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class DoodleView: UIView {
    
    var paths = [UIBezierPath()] // structure to hold paths
    var color = UIColor.blackColor()
    
    //Hey Robbe! What's happening here is that apparently a very doable way to do this is to have an array of UIBezierPaths which you collect everytime the finger is lifted and the path is done. You actually add the path first to the array when the user first touches the screen and then the path is built upon as the users touch moves to a new location. I think if we want a very basic model with no control of linewidth or color this just needs a few more lines. I'm getting a really strange bung in the touchesMoved method which is why it's commented out rn

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //set of touches
        var path = UIBezierPath()
        self.paths.append(path)
        if let newPoint = touches.first?.locationInView(self) {
            self.paths.last?.moveToPoint(newPoint)
        }//CGPoint
    }
    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let newPoint = touches.first?.locationInView(self) {
//            paths.last?.addLineToPoint(touches.first?.locationInView(self))
//        }
//    }
    
    override func drawRect(rect: CGRect) {
        for path in paths{
            path.stroke()
        }
    }
}
