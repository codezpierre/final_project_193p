//
//  DoodleViewController.swift
//  FinalProject
//
//  Created by robbes on 5/23/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit

class DoodleViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        doodleView.userInteractionEnabled = true
        self.title = "Doodle"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //shake to clear doodle
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            if !doodleView.paths.isEmpty {
            doodleView.clear()
            }
        }
    }
    
    @IBOutlet weak var doodleView: DoodleView!
    
    
    @IBAction func undo(sender: UIBarButtonItem) {
        doodleView.undoDoodle()
    }

    @IBAction func clear(sender: UIBarButtonItem) {
        doodleView.clear()
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        let image = doodleView.createPhoto()
        
        //create UIActivityViewController to share image
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender.customView
        self.presentViewController(activityVC, animated: true, completion: nil)
    }

    @IBAction func changeColor(sender: UIBarButtonItem) {
        let title = "Choose a color"
        //blue button
        let actionSheetController = UIAlertController(title: title, message: nil, preferredStyle: .ActionSheet)
        let blue = UIAlertAction(title: "Blue", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.blueColor())
        })
        actionSheetController.addAction(blue)
        
        let black = UIAlertAction(title: "Black", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.blackColor())
            })
        actionSheetController.addAction(black)
        
        let red = UIAlertAction(title: "Red", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.redColor())
            })
        actionSheetController.addAction(red)
        
        let green = UIAlertAction(title: "Green", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.greenColor())
            })
        actionSheetController.addAction(green)
        
        let yellow = UIAlertAction(title: "Yellow", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.yellowColor())
            })
        actionSheetController.addAction(yellow)
        
        let dissmissView = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (UIAlertAction)-> Void in
          actionSheetController.dismissViewControllerAnimated(true, completion: nil)
        })
        actionSheetController.addAction(dissmissView)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func sliderAction(sender: UISlider) {
        doodleView.setLineWidth(sender.value)
    }
    
//    @IBAction func changeThickness(sender: UIBarButtonItem) {
//        
//        
//        
//        let actionSheetController = UIAlertController(title: "Slide for Thickness", message: nil, preferredStyle: .Alert)
//        
//        let dissmissView = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (UIAlertAction)-> Void in
//            actionSheetController.dismissViewControllerAnimated(true, completion: nil)
//        })
//        actionSheetController.addAction(dissmissView)
//        
//        print(actionSheetController.view.frame.size.width)
//        
//        print(actionSheetController.view.frame.size.height)
//        let slider = UISlider(frame: actionSheetController.view.bounds)
//        
//        actionSheetController.view.addSubview(slider)
//        
//        self.presentViewController(actionSheetController, animated: true, completion: nil)
//        //doodleView.setLineWidth()
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
