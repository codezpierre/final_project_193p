//
//  DoodleView.swift
//  FinalProject
//
//  Created by robbes on 5/23/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class DoodleView: UIView {
    
    var paths = [UIBezierPath]() // structure to hold paths
    var color = UIColor.blackColor()
    
    var colors = [UIColor]()
    
    var lineWidths = [CGFloat]()
    
    var currentPathColor = UIColor.blackColor()
    
    var currentPathWidth: CGFloat = 1.0
    
    var currentGraphicsContext: CGContextRef?
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //set of touches
        let path = UIBezierPath()
        self.paths.append(path)
        if let newPoint = touches.first?.locationInView(self) {
            self.paths.last?.moveToPoint(newPoint)
            colors.append(currentPathColor)
            lineWidths.append(CGFloat(currentPathWidth))
        }//CGPoint
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let newPoint = touches.first?.locationInView(self) { //this gives you a CGPoint
            paths.last?.addLineToPoint(newPoint)
            setNeedsDisplay()
            
        }
    }
    
    func createPhoto() -> [AnyObject]{
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //call UIActivityViewController so that you can share the photo
        let objectToShare = [image]
        return objectToShare
        //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    
    func undoDoodle() {
        if !paths.isEmpty {
            paths.removeLast()
            colors.removeLast()
            lineWidths.removeLast()
            setNeedsDisplay()
        }
    }
    
    func clear() {
        if !paths.isEmpty {
            //add animation
            UIView.transitionWithView(self,
                                      duration: 1.0,
                                      options: [UIViewAnimationOptions.TransitionCurlUp],
                                      animations: { self.paths.removeAll();
                                        self.colors.removeAll();
                                        self.lineWidths.removeAll();
                                        self.setNeedsDisplay();},
                                      completion: nil
            )
            
        }
    }
    
    func changeColor(color: UIColor) {
        currentPathColor = color
    }
    
    func setLineWidth(thickness: Float) {
        currentPathWidth = CGFloat(thickness)
    }
    
    override func drawRect(rect: CGRect) {
        //currentGraphicsContext = UIGraphicsGetCurrentContext() //first
        for (index, path) in paths.enumerate(){
            let currColor = colors[index]
            let thickness = lineWidths[index]
            currColor.setStroke()
            path.lineWidth = thickness
            path.stroke()
        }
    }
}
