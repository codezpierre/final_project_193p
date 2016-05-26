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
    
    
    @IBAction func undo(sender: AnyObject) {
    }

    @IBAction func clear(sender: AnyObject) {
    }
    
    
    @IBAction func save(sender: AnyObject) {
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
