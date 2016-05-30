//
//  NewTripViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/17/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData


class NewTripViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DestinationTextfield: UITextField!
    @IBOutlet weak var departDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!
    
    
    
    @IBAction func cancel(sender: AnyObject) {
        let alert = UIAlertController(
            title:"Alert",
            message:"Are you sure want to Cancel?",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        //Isaiah and Amy helped me a little with this function when I was missing the "handler" parameter
        
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
        image = UIImage(named: "photoNotAvailable")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        DestinationTextfield.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        if savedDepartDate != nil {
            departDateLabel.text = "\(savedDepartDate!)"
        }
        if savedReturnDate != nil {
            returnDateLabel.text = "\(savedReturnDate!)"
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
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.mediaTypes = [kUTTypeImage as String]
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }

//    func takeCameraPhoto() {
//        picker.sourceType = ImagePickerControllerSourceType.Camera
//        picker.delegate = self
//    }
    
//    picker.allowsEditing = false
//    picker.sourceType = UIImagePickerControllerSourceType.Camera
//    picker.cameraCaptureMode = .Photo
//    picker.modalPresentationStyle = .FullScreen
//    presentViewController(picker,
//    animated: true,
//    completion: nil)
    
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
            //need to fix this to handle the case where image doesnt exist
            Trip.createTrip(DestinationTextfield.text!, departureDate: savedDepartDate!, returnDate: savedReturnDate!, image: UIImagePNGRepresentation(image!)!)
            
        }
    }
}



