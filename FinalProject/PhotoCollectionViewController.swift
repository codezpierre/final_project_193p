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
        
        //set photo cell to images saved from Travel Log
        if let photoCell = cell as? PhotoCollectionViewCell {
            if let imageData = trip.image {
                let imageDesired = UIImage(data: imageData)
                photoCell.image.image = imageDesired
            }
        }
        
        return cell
    }
}
