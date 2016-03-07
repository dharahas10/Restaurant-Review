//
//  ResturantTableViewController.swift
//  FoodPin
//
//  Created by Dharahas Tallapally on 19/10/15.
//  Copyright © 2015 Dharahas Tallapally. All rights reserved.
//

import UIKit
import CoreData

class ResturantTableViewController: UITableViewController , NSFetchedResultsControllerDelegate, UISearchResultsUpdating{
    
    
    /*
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "PalominoEspresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg","petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg","haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg","grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg","confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
        "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London","London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop","Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe","American / Seafood", "American", "American","Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish","Spanish", "British", "Thai"]

    
    
    
    var restaurantIsChecked = [Bool](count: 21, repeatedValue: false)
    
    */
    /*
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "thaicafe.jpg", isVisited: false)
        ]
    */
    
    var restaurants : [Restaurant] = []
    
    var fetchResultController:NSFetchedResultsController!
    
    var searchController: UISearchController!
    
    var searchResults: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        
        let fetchRequest = NSFetchRequest(entityName: "Restaurant")
        let sortDescription = NSSortDescriptor (key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescription]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext {
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            
            fetchResultController.delegate = self
            
            var e:NSError?
            
            var result:Bool
            do{
                
                try fetchResultController.performFetch()
                result = true
                
            }catch let error as NSError{
                
                e = error
                result = false
            }
            
            restaurants = fetchResultController.fetchedObjects as! [Restaurant]
            
            if result != true{
                
                print(e?.localizedDescription)
            }
            
            
            
            
        }
        
        // searchCOntroller search bar
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.whiteColor()
        searchController.searchBar.placeholder = NSLocalizedString("Search your restaurant", comment: "Search your restaurant")
        definesPresentationContext = true
        
        searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        
        
        
        
        
            
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasViewedWalkthrough = defaults.boolForKey("hasViewedWalkthrough")
        if hasViewedWalkthrough == false {
            if let pageViewController =
            storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as?
            PageViewController {
            self.presentViewController(pageViewController, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.active {
            return searchResults.count
        } else {
            return self.restaurants.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
            let restaurant = (searchController.active) ? searchResults[indexPath.row] :
            restaurants[indexPath.row]
            
        cell.nameLabel.text = restaurant.name
        cell.thumbnailInamgeView.image = UIImage(data: restaurant.image)
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailInamgeView.layer.cornerRadius = 10 //cell.thumbnailInamgeView.frame.size.width/2
        cell.thumbnailInamgeView.clipsToBounds = true
        
       
        cell.favorIconImageView.hidden = !restaurant.isVisited.boolValue
        
        
        /*if restaurantIsChecked[indexPath.row] {
            
            cell.accessoryType = .Checkmark
            
        } else{
            
            cell.accessoryType = .None
            
        }

        */
    
        
        
        
        
        
        // Configure the cell...

        return cell
    }
    
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let optionMenu = UIAlertController(title: nil, message: "What you want to do", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        
        let callActionHnadler = { (action: UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "No Service", message: "Call service is not available yet", preferredStyle: .Alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertMessage, animated: true, completion: nil)
            
            
        }
        
        let callAction = UIAlertAction(title: "Call 9078068191", style: .Default, handler: callActionHnadler)
        
        optionMenu.addAction(callAction)
        
        let isVisitedTitle = restaurantIsChecked[indexPath.row] ? "I havent been to here before" : "I have been here"
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
            
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            
            
            // cell?.accessoryType = .Checkmark
            self.restaurantIsChecked[indexPath.row] = self.restaurantIsChecked[indexPath.row] ? false : true
            
            cell.favorIconImageView.hidden = !self.restaurantIsChecked[indexPath.row]
          
        })
        
        
        optionMenu.addAction(isVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        
    }
    
    */
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete{
            
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            //self.tableView.reloadData()
            
        }
        
        /*
        print("Total item: \(self.restaurantNames.count)")
        
        for names in restaurantNames {
            
            print(names)
        }
        */
        
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: {
            
            (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            
            
        })
        
        
       
            
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete",handler:
            {
                
            (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // Delete the row from the data source
            
                if let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext{
                    
                    let restaurantToDelete = self.fetchResultController.objectAtIndexPath(indexPath) as! Restaurant
                    
                    managedObjectContext.deleteObject(restaurantToDelete)
                    
                    do{
                        
                        try managedObjectContext.save()
                        
                    }catch let error as NSError{
                        
                        print("delete error" + error.localizedDescription)
                        
                        
                    }
                }
                
            })
        
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showRestaurantDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let destinationController = segue.destinationViewController as! DetailViewController
                
            destinationController.restaurant = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
                
                
            }
            
        }
        
    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
        
    } 
        
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        
        tableView.beginUpdates()
        
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type{
            
        case.Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case.Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case.Update:
            tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        default:
            tableView.reloadData()
            
            
            
        }
        
        
        restaurants = controller.fetchedObjects as! [Restaurant]
        
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func filterContentSearchText(searchText:String){
        searchResults = restaurants.filter({ ( restaurant: Restaurant) -> Bool in
            let nameMatch = restaurant.name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let locationMatch = restaurant.location.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil || locationMatch != nil
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        let searchText = searchController.searchBar.text
        filterContentSearchText(searchText!)
        tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            if searchController.active {
                return false
            } else {
                return true
            }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
