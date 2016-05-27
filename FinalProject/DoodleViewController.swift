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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var doodleView: DoodleView!
    
    
    @IBAction func undo(sender: UIBarButtonItem) {
        doodleView.undoDoodle()
    }

    @IBAction func clear(sender: UIBarButtonItem) {
        doodleView.clear()
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
    }

    @IBAction func changeColor(sender: UIBarButtonItem) {
        let title = "Color pallette"
        //blue button
        let actionSheetController = UIAlertController(title: title, message: nil, preferredStyle: .ActionSheet)
        let blue = UIAlertAction(title: "Blue", style: .Default, handler: { [weak weakSelf = self] (UIAlertAction) -> Void in
            weakSelf!.doodleView.changeColor(UIColor.blueColor())
        })
        actionSheetController.addAction(blue)
        
        let dissmissView = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (UIAlertAction)-> Void in
          actionSheetController.dismissViewControllerAnimated(true, completion: nil)
        })
        actionSheetController.addAction(dissmissView)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func changeThickness(sender: UIBarButtonItem) {
        doodleView.setLineWidth()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
