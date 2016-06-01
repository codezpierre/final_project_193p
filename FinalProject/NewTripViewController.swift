//
//  NewTripViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/17/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

//Isaiah and Amy helped me a little with the UIAlertAction
//date formatting help came from https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSDateFormatter_Class/


import UIKit
import MobileCoreServices
import CoreData


class NewTripViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DestinationTextfield: UITextField!
    @IBOutlet weak var departDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!
    
    let picker = UIImagePickerController()
    
    @IBAction func cancel(sender: AnyObject) {
        let alert = UIAlertController(
            title:"Alert",
            message:"Are you sure want to Cancel?",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alert.addAction(UIAlertAction(title: "No", style: .Default, handler: { action  in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action  in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    //variables set in the DatePickerVC
    var savedDepartDate: NSDate?
    var savedReturnDate: NSDate?
    
    private var image: UIImage? {
        get {
            return imageView?.image
        }
        set {
            imageView?.image = newValue
        }
    }
    
    
    @IBAction func uploadPhoto(sender: UIButton) {
        importPhotoFromLibrary()
    }
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create a New Trip"
        image = UIImage(named: "photoNotAvailable")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        DestinationTextfield.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        //formats return and depart date and updates the Labels
        if savedDepartDate != nil {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            
            let date = NSDate(timeIntervalSinceReferenceDate: 118800)
            
            // US English Locale (en_US)
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
            NSLog("%@", dateFormatter.stringFromDate(date)) // Jan 2, 2001

            departDateLabel.text = dateFormatter.stringFromDate(savedDepartDate!) ?? "Depart Date"
        }
        if savedReturnDate != nil {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            
            let date = NSDate(timeIntervalSinceReferenceDate: 118800)
            
            // US English Locale (en_US)
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
            NSLog("%@", dateFormatter.stringFromDate(date)) // Jan 2, 2001
            returnDateLabel.text = dateFormatter.stringFromDate(savedReturnDate!) ?? "Return Date"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.image = image
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    /* importPhotoFromLibrary() presents a new view controller where the user
     can pick a photo from their photo library */
    func importPhotoFromLibrary() {
        picker.sourceType = .PhotoLibrary
        picker.mediaTypes = [kUTTypeImage as String]
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    /* takePhoto() allows user to use their camera to take a photo if their device is connected */
    @IBAction func takePhoto(sender: AnyObject) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.modalPresentationStyle = .FullScreen
            picker.delegate = self
            presentViewController(picker,
                                  animated: true,
                                  completion: nil)
        } else {
            cameraNotAvailable()
        }
    }
    
    //used to redirect simulator so it doesn't crash on account of not having a camera option
    func cameraNotAvailable(){
        let alert = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.Default,
            handler: nil)
        alert.addAction(okAction)
        presentViewController(alert,
                              animated: true,
                              completion: nil)
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "unwindFromNewTripDone" {
            //if any of these field are Nil, you will not be able to click "Done"
            if DestinationTextfield.text == "" || savedDepartDate == nil || savedReturnDate == nil || imageView.image == "photoNotAvailable" {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
    //unwinding from DatePickerVC
    @IBAction func saveDate(segue: UIStoryboardSegue) {
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController
        let identifier = segue.identifier
        if let pickDateVC = destinationVC as? DatePickerViewController {
            if identifier == "setDepartureDate" {
                pickDateVC.newTripViewController = self
                pickDateVC.isDeparture = true
                
            }
            if identifier == "setReturnDate" {
                pickDateVC.newTripViewController = self
                pickDateVC.isDeparture = false
            }
        } else {
            Trip.createTrip(DestinationTextfield.text!, departureDate: savedDepartDate!, returnDate: savedReturnDate!, image: UIImagePNGRepresentation(image!)!)

        }
    }
}



