//
//  SearchForLocationTableViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/30/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

//ideas on search bar from https://grokswift.com/swift-tableview-search-bar/  and http://www.thorntech.com/2016/01/how-to-search-for-location-using-apples-mapkit/

import UIKit
import MapKit

class SearchForLocationTableViewController: UITableViewController {
    var matchingItems:[MKMapItem] = []
    var mapView:MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil
    
        //parces location names
        func parseAddress(selectedItem:MKPlacemark) -> String {
            // insert first space
            let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
            // put a comma between street and city/state
            let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
            // put a space between multi-word locations
            let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
            let addressLine = String(
                format:"%@%@%@%@%@%@%@",
                // street number
                selectedItem.subThoroughfare ?? "",
                firstSpace,
                // street name
                selectedItem.thoroughfare ?? "",
                comma,
                // city
                selectedItem.locality ?? "",
                secondSpace,
                // state
                selectedItem.administrativeArea ?? ""
            )
            return addressLine
        }
}

//updates results as searchBarText changes
extension SearchForLocationTableViewController : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }
}

//configures tableView
extension SearchForLocationTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = parseAddress(selectedItem)
        return cell
    }
}

//allows transition between tableView cell and pin on map
extension SearchForLocationTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
}
