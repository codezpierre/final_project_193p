//
//  NewTripViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/17/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import MobileCoreServices


class NewTripViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate{
    
    //    var managedObjectContext: NSManagedObjectContext? = AppDelegate.managedObjectContext
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DestinationTextfield: UITextField!
    @IBOutlet weak var DepartDatePicker: UIDatePicker!
    @IBOutlet weak var ReturnDatePicker: UIDatePicker!

    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func Done(sender: UIBarButtonItem) {
//        if let imageView = imageView.image {
//            let imageData = NSData(UIImageView: imageView)
//        }
        
        //let imageData = NSData(UIImageView: imageView.image)

//        Trip.createTrip((DestinationTextfield?.text)!, departureDate: DepartDatePicker.date, returnDate: ReturnDatePicker.date, image: imageData)//imageView.image)
    }
    
    // MARK: Private API
    private var aspectRatioConstraint: NSLayoutConstraint?
    
    // Computed Property to ensure that our UIImage is well formatted
    // and maintains aspect ratio
    private var image: UIImage? {
        get {
            return imageView?.image
        }
        set {
            imageView?.image = newValue
            // remove any existing aspect ratio constraint on the imageView
//            if aspectRatioConstraint != nil {
//                imageView.removeConstraint(aspectRatioConstraint!)
//                aspectRatioConstraint = nil
//            }
//            // add a new aspect ratio constraint on the imageView
//            // the imageView will be constrained to have the same aspect ratio as its image
//            // this code should look very similar to an inspected constraint in Interface Builder
//            if let image = newValue, let imageView = imageView {
//                let aspectRatio = image.size.width / image.size.height
//                aspectRatioConstraint = NSLayoutConstraint(
//                    item: imageView,
//                    attribute: .Width,
//                    relatedBy: .Equal,
//                    toItem: imageView,
//                    attribute: .Height,
//                    multiplier: aspectRatio,
//                    constant: 0
//                )
//                imageView.addConstraint(aspectRatioConstraint!)
//            }
        }
    }
    
    
    @IBAction func uploadPhoto(sender: UIButton) {
        importPhotoFromLibrary()
    }
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image = UIImage(named: "photoNotAvailable")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        DestinationTextfield.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.image = image
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    // Function presents a new view controller where the user
    // can pick a photo from their photo library
    func importPhotoFromLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.mediaTypes = [kUTTypeImage as String]
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    //    // MARK: Gestures
    //    // This function handles a tap gesture on the photo. When a tap gesture
    //    // is recognized, a popover view controller is shown to prompt the user
    //    // if they want to take a new photo with their camera or to choose a
    //    // photo from their photo library
    //    @IBAction func handleTap(recognizer: UITapGestureRecognizer) {
    //        let optionViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Library Photo Option") as! LibaryCameraOptionViewController
    //        optionViewController.modalPresentationStyle = .Popover
    //        let popoverOptionViewController = optionViewController.popoverPresentationController
    //        popoverOptionViewController?.permittedArrowDirections = .Any
    //        popoverOptionViewController?.delegate = self
    //        popoverOptionViewController?.sourceView = recognizer.view
    //        popoverOptionViewController?.sourceRect = CGRect(x: recognizer.locationInView(recognizer.view.self).x, y: recognizer.locationInView(recognizer.view.self).y, width: 1, height: 1)
    //        presentViewController(optionViewController, animated: true, completion: nil)
    //    }
    //
    //    // MARK: UIPopoverPresentationControllerDelegate
    //    func adaptivePresentationStyleForPresentationController(
    //        controller: UIPresentationController) -> UIModalPresentationStyle {
    //        return .None
    //    }
    
    // MARK: Navigation
    // Function returns true if a valid entry was typed in, but returns false
    // if a valid entry was not. In any case, an appropriate alert is shown
    // to the user
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "Done Adding Photo" {
            if DestinationTextfield.text! == "" {
                let alertNoEntry = UIAlertController(title: "Destination Was Not Added", message: "Required fields are missing", preferredStyle: UIAlertControllerStyle.Alert)
                alertNoEntry.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alertNoEntry, animated: true, completion: nil)
                return false
            }
            return true //make sure this doesnt stay, I put this here bc this function has to return a boolean (RS)
        }
        return true
    }
}
//@IBAction func saveNewTrip(segue: UIStoryboardSegue) {
//
//}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

//}
