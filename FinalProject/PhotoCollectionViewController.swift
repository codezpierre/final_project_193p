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
    // global variable
    // var photos: [UIImage]?
    //private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    // var totalPhotos = 0
    // private var cellSize: CGSize? = nil
    
    
    // MARK: Private API
    // Function calculates the size that each collection view cell should be
    //    private func calculateCellSize() {
    //        let scaleFactor = collectionView!.frame.width/2.5/tempImage!.size.width
    //        var tempSize = CGSize(width: tempImage!.size.width*scaleFactor, height: tempImage!.size.height*scaleFactor)
    //        tempSize.height += tempSize.width/3.5
    //        cellSize = tempSize
    //    }
    
    
    
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
    //
    //    func importPhotoFromLibrary() {
    //        let picker = UIImagePickerController()
    //        picker.sourceType = .PhotoLibrary
    //        picker.mediaTypes = [kUTTypeImage as String]
    //        picker.allowsEditing = true
    //        picker.delegate = self
    //        presentViewController(picker, animated: true, completion: nil)
    //    }
    //
    //
    //    // MARK: UICollectionViewDelegateFlowLayout
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //        return cellSize!
    //    }
    //
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    //        return sectionInsets
    //    }
    //
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    //        return 8.0
    //    }
    //
    //    func collectionView(collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                               minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    //        return 8.0
    //    }
}
