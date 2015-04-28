//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        navigationBar.titleView = searchBar
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        searchBar.becomeFirstResponder()

    }
    
    override func viewDidAppear(animated: Bool) {
        if (count(searchBar.text) > 0) {
            search(searchBar.text)
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search(searchBar.text)
    }
    
    func search(searchTerm: String) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var sortSwitch = defaults.integerForKey("sort")
        var sortMode: YelpSortMode!
        switch(sortSwitch) {
        case 1:
            sortMode = YelpSortMode.Distance
        case 2:
            sortMode = YelpSortMode.HighestRated
        default:
            sortMode = YelpSortMode.BestMatched
        }
        
        var distance = defaults.integerForKey("distance") as? Int
        if (distance == nil) {
            distance = 1000
        }
        
        var categories = defaults.objectForKey("categories") as? [String]
        if (categories == nil) {
            categories = [""]
        }
        
        var deals = defaults.boolForKey("deals") as Bool
        
        Business.searchWithTerm(searchTerm, sort: sortMode, categories: categories, distance: distance, deals: deals, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            if (self.tableView.numberOfSections() > 0) {
                var top = NSIndexPath(forRow: Foundation.NSNotFound, inSection: 0);
                self.tableView.scrollToRowAtIndexPath(top, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            }
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("restCell") as! RestTableViewCell
        cell.myBusiness = self.businesses[indexPath.row]
        cell.updateInfo()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (businesses == nil) {
            return 0
        }
        return businesses.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
