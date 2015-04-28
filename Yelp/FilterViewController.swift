//
//  FilterViewController.swift
//  Yelp
//
//  Created by Yale Thomas on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dealsSwitch: UISwitch!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    
    var categories: [Category]! = [
        Category(label: "Afghan", value: "afghani"),
        Category(label: "African", value: "african"),
        Category(label: "American (New)", value: "newamerican"),
        Category(label: "American (Traditional)", value: "tradamerican"),
        Category(label: "Arabian", value: "arabian"),
        Category(label: "Argentine", value: "argentine"),
        Category(label: "Armenian", value: "armenian"),
        Category(label: "Asian Fusion", value: "asianfusion"),
        Category(label: "Australian", value: "australian"),
        Category(label: "Austrian", value: "austrian"),
        Category(label: "Bangladeshi", value: "bangladeshi"),
        Category(label: "Barbeque", value: "bbq"),
        Category(label: "Basque", value: "basque"),
        Category(label: "Belgian", value: "belgian"),
        Category(label: "Brasseries", value: "brasseries"),
        Category(label: "Brazilian", value: "brazilian"),
        Category(label: "Breakfast & Brunch", value: "breakfast_brunch"),
        Category(label: "British", value: "british"),
        Category(label: "Buffets", value: "buffets"),
        Category(label: "Burgers", value: "burgers"),
        Category(label: "Burmese", value: "burmese"),
        Category(label: "Cafes", value: "cafes"),
        Category(label: "Cafeteria", value: "cafeteria"),
        Category(label: "Cajun/Creole", value: "cajun"),
        Category(label: "Cambodian", value: "cambodian"),
        Category(label: "Caribbean", value: "caribbean"),
        Category(label: "Catalan", value: "catalan"),
        Category(label: "Cheesesteaks", value: "cheesesteaks"),
        Category(label: "Chicken Wings", value: "chicken_wings"),
        Category(label: "Chinese", value: "chinese"),
        Category(label: "Comfort Food", value: "comfortfood"),
        Category(label: "Creperies", value: "creperies"),
        Category(label: "Cuban", value: "cuban"),
        Category(label: "Czech", value: "czech"),
        Category(label: "Delis", value: "delis"),
        Category(label: "Diners", value: "diners"),
        Category(label: "Ethiopian", value: "ethiopian"),
        Category(label: "Fast Food", value: "hotdogs"),
        Category(label: "Filipino", value: "filipino"),
        Category(label: "Fish & Chips", value: "fishnchips"),
        Category(label: "Fondue", value: "fondue"),
        Category(label: "Food Court", value: "food_court"),
        Category(label: "Food Stands", value: "foodstands"),
        Category(label: "French", value: "french"),
        Category(label: "Gastropubs", value: "gastropubs"),
        Category(label: "German", value: "german"),
        Category(label: "Gluten-Free", value: "gluten_free"),
        Category(label: "Greek", value: "greek"),
        Category(label: "Halal", value: "halal"),
        Category(label: "Hawaiian", value: "hawaiian"),
        Category(label: "Himalayan/Nepalese", value: "himalayan"),
        Category(label: "Hot Dogs", value: "hotdog"),
        Category(label: "Hot Pot", value: "hotpot"),
        Category(label: "Hungarian", value: "hungarian"),
        Category(label: "Iberian", value: "iberian"),
        Category(label: "Indian", value: "indpak"),
        Category(label: "Indonesian", value: "indonesian"),
        Category(label: "Irish", value: "irish"),
        Category(label: "Italian", value: "italian"),
        Category(label: "Japanese", value: "japanese"),
        Category(label: "Korean", value: "korean"),
        Category(label: "Kosher", value: "kosher"),
        Category(label: "Laotian", value: "laotian"),
        Category(label: "Latin American", value: "latin"),
        Category(label: "Live/Raw Food", value: "raw_food"),
        Category(label: "Malaysian", value: "malaysian"),
        Category(label: "Mediterranean", value: "mediterranean"),
        Category(label: "Mexican", value: "mexican"),
        Category(label: "Middle Eastern", value: "mideastern"),
        Category(label: "Modern European", value: "modern_european"),
        Category(label: "Mongolian", value: "mongolian"),
        Category(label: "Moroccan", value: "moroccan"),
        Category(label: "Pakistani", value: "pakistani"),
        Category(label: "Persian/Iranian", value: "persian"),
        Category(label: "Peruvian", value: "peruvian"),
        Category(label: "Pizza", value: "pizza"),
        Category(label: "Polish", value: "polish"),
        Category(label: "Portuguese", value: "portuguese"),
        Category(label: "Russian", value: "russian"),
        Category(label: "Salad", value: "salad"),
        Category(label: "Sandwiches", value: "sandwiches"),
        Category(label: "Scandinavian", value: "scandinavian"),
        Category(label: "Scottish", value: "scottish"),
        Category(label: "Seafood", value: "seafood"),
        Category(label: "Singaporean", value: "singaporean"),
        Category(label: "Slovakian", value: "slovakian"),
        Category(label: "Soul Food", value: "soulfood"),
        Category(label: "Soup", value: "soup"),
        Category(label: "Southern", value: "southern"),
        Category(label: "Spanish", value: "spanish"),
        Category(label: "Steakhouses", value: "steak"),
        Category(label: "Sushi Bars", value: "sushi"),
        Category(label: "Taiwanese", value: "taiwanese"),
        Category(label: "Tapas Bars", value: "tapas"),
        Category(label: "Tapas/Small Plates", value: "tapasmallplates"),
        Category(label: "Tex-Mex", value: "tex-mex"),
        Category(label: "Thai", value: "thai"),
        Category(label: "Turkish", value: "turkish"),
        Category(label: "Ukrainian", value: "ukrainian"),
        Category(label: "Uzbek", value: "uzbek"),
        Category(label: "Vegan", value: "vegan"),
        Category(label: "Vegetarian", value: "vegetarian"),
        Category(label: "Vietnamese", value: "vietnamese")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "back:")
        
        self.navigationItem.leftBarButtonItem = newBackButton;
        tableView.delegate = self
        tableView.dataSource = self
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if var categoryArr = defaults.objectForKey("categories") as? [String] {
            for category in categories {
                category.selected = contains(categoryArr, category.value)
            }
        }
        setText()
        // Do any additional setup after loading the view.
    }
    
    func setText() {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        
        var sortSwitch = defaults.integerForKey("sort")
        var sortMode: String!
        switch(sortSwitch) {
        case 1:
            sortMode = "Distance"
        case 2:
            sortMode = "Highest Rated"
        default:
            sortMode = "Best Matched"
        }
        
        var meters = defaults.integerForKey("distance")
        if (meters == 0) {
            meters = 1000
        }
        var miles = Double(meters) / 1600
        
        
        sortButton.setTitle("Sort: " + sortMode, forState: UIControlState.Normal)
        distanceButton.setTitle("Distance: \(miles) miles", forState: UIControlState.Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("catCell") as! FilterTableViewCell
        cell.myCategory = categories[indexPath.row]
        cell.updateData()
        return cell
    }
    
    @IBAction func sortMenu(sender: AnyObject) {
        var modes = ["Best Matched", "Distance", "Highest Rated"]
        ActionSheetStringPicker.showPickerWithTitle("Sorting Mode", rows: modes, initialSelection: 0, doneBlock: { (actionPicker: ActionSheetStringPicker!, selectedInd: Int, hurrr: AnyObject!) -> Void in
            var defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(selectedInd, forKey: "sort")
            defaults.synchronize()
            self.setText()
            }, cancelBlock: { (myPicker: ActionSheetStringPicker!) -> Void in
            return
            }, origin: sender)
    }

    @IBAction func distanceMenu(sender: AnyObject) {
        var modes = ["Best Matched", "Distance", "Highest Rated"]
        let picker = ActionSheetDistancePicker(title: "Distance", bigUnitString: "miles", bigUnitMax: 9, selectedBigUnit: 1, smallUnitString: "feet", smallUnitMax: 5280, selectedSmallUnit: 0, target: self, action: Selector("distanceMeasurementSelected:smallUnit:element:"), origin: sender)
        
        picker.showActionSheetPicker()
    }
    
    func distanceMeasurementSelected(bigUnit: NSNumber, smallUnit: NSNumber, element: AnyObject!) {
        var meters: Double = Double(bigUnit) * 1609.0
        meters += Double(Double(smallUnit) * 0.3)
        meters = floor(meters)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(Int(meters), forKey: "distance")
        defaults.synchronize()
        setText()
    }
    
    func back(sender: UIBarButtonItem) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var cats: [String] = []
        
        for category in self.categories {
            if (category.selected) {
                cats.append(category.value)
            }
        }
        
        defaults.setObject(cats, forKey: "categories")
        defaults.setBool(dealsSwitch.on, forKey: "deals")
        self.navigationController?.popViewControllerAnimated(true)
    }


}

class Category {
    var label: String
    var name: String?
    var value: String
    var selected: Bool
    
    init(label: String, name: String? = nil, value: String, selected: Bool = false) {
        self.label = label
        self.name = name
        self.value = value
        self.selected = selected
    }
    
}
