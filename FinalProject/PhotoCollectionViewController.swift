//
//  PhotoCollectionViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/13/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData


private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate {
    
    var trips: [Trip]? {
        didSet{
            updateUI()
        }
    }
    
//    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    var managedObjectContext: NSManagedObjectContext? {
        return ((UIApplication.sharedApplication().delegate) as? AppDelegate)?.managedObjectContext
    }
    
    // MARK: UIViewController Lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        do {
            if let fetchResults = try managedObjectContext!.executeFetchRequest(fetchRequest) as? [Trip] {
                trips = fetchResults
            }
        } catch {
            print(error)
        }
    }
    
    private func updateUI() {
        collectionView!.reloadData() //redraws UI
    }
       //    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("contactCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
    //
    //        // Configure the cell
    //        var contactPhoto = UIImage()
    //        let scaleFactor = cell.frame.width/image!.size.width
    //        contactPhoto = resizeImage(contactPhoto!, scale: scaleFactor)
    //        cell.imageView?.image = contactPhoto
    //        cell.backgroundColor = UIColor.purpleColor()
    //        return cell
    //    }
    //
    //    // Function resizes the given image to the given scale so all of our
    //    // collection view cells can have the same size
    //    private func resizeImage(image: UIImage, scale: CGFloat) -> UIImage {
    //        let newHeight = image.size.height * scale
    //        let newWidth = image.size.width * scale
    //        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
    //        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
    //        let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //
    //        return newImage
    //    }
    //
    //    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    //        self.collectionView?.reloadData()
    //    }
    //
    //
    //
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if trips == nil {
            return 0
        } else {
            return trips!.count
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath)
        
        let trip = trips![indexPath.row]
        
        
        
        if let photoCell = cell as? PhotoCollectionViewCell {
            if let imageData = trip.image {
                let imageDesired = UIImage(data: imageData)
                photoCell.image.image = imageDesired
            }
        }
        
        return cell
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
    //    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
    //        if identifier == "Done Adding Photo" {
    //            if DestinationTextfield.text! == "" {
    //                let alertNoEntry = UIAlertController(title: "Destination Was Not Added", message: "Required fields are missing", preferredStyle: UIAlertControllerStyle.Alert)
    //                alertNoEntry.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    //                self.presentViewController(alertNoEntry, animated: true, completion: nil)
    //                return false
    //            }
    //            return true //make sure this doesnt stay, I put this here bc this function has to return a boolean (RS)
    //        }
    //        return true
    //    }
    //}
    
    //let dateFormatter = NSDateFormatter()
    //                dateFormatter.dateFormat("yyyy-MM-dd hh:mm:ssZZZZ")
    //                let date = dateFormatter.dateFromString(departDateLabel)
    

//    private var image: UIImage? {
//        get {
//            return imageView?.image
//        }
//        set {
//            imageView?.image = newValue
//        }
//    }
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        self.image = image
//        picker.dismissViewControllerAnimated(true, completion:nil)
//    }
//    
//    /* importPhotoFromLibrary() presents a new view controller where the user
//     can pick a photo from their photo library */
//    func importPhotoFromLibrary() {
//        let picker = UIImagePickerController()
//        picker.sourceType = .PhotoLibrary
//        picker.mediaTypes = [kUTTypeImage as String]
//        picker.allowsEditing = true
//        picker.delegate = self
//        presentViewController(picker, animated: true, completion: nil)
//    }
 
}
