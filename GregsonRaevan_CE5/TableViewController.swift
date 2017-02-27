//
//  TableViewController.swift
//  GregsonRaevan_CE5
//
//  Created by Raevan Gregson on 12/5/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    private let cellIdentifier = "Cell"
    
    //the datamodel arrays, one to hold all of the data and one for filtered data
    var cars = [Car]()
    var filteredCars = [Car]()
    
    var filterByscope = false
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup SeachController
        searchController.dimsBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        //To recieve updates
        searchController.searchResultsUpdater = self
        
        //setup SearchBar of SearchController
        searchController.searchBar.scopeButtonTitles = ["All","Electric", "Gas", "Deisel"]
        searchController.searchBar.delegate = self
        //add the searchBar to the tablVeiew
        tableView.tableHeaderView = searchController.searchBar
        
        //fix any sizing bugs that sometimes occur
        searchController.searchBar.sizeToFit()
        
        //load in my data
        let modelS = Car(brand: "Tesla",name:"Model S",make: Car.Make(rawValue: "Electric")!,image:#imageLiteral(resourceName: "TeslaModelS"))
        let leaf = Car(brand:"Nissan", name:"Leaf", make:Car.Make(rawValue: "Electric")!, image:#imageLiteral(resourceName: "NissanLeaf"))
        let sierraDenali = Car(brand: "GMC",name:"Sierra 2500 Denali",make: Car.Make(rawValue: "Deisel")!,image:#imageLiteral(resourceName: "SierraDenali2500HD"))
        let cadillacCTS = Car(brand: "Cadillac",name:"Cadillac CTS-V",make: Car.Make(rawValue: "Gas")!,image:#imageLiteral(resourceName: "CadillacCTSV"))
        let acadia = Car(brand: "GMC",name:"Acadia",make: Car.Make(rawValue: "Gas")!,image:#imageLiteral(resourceName: "gmcAcadia"))
        let elr = Car(brand: "Cadillac",name:"ELR",make: Car.Make(rawValue: "Electric")!,image:#imageLiteral(resourceName: "CadillacELR"))
        
        
        cars = [modelS,leaf,sierraDenali,cadillacCTS,acadia,elr]
        
        //fixes console warning for deallocating the search bar.
        searchController.view.removeFromSuperview()
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        if let nav = navigationController{
            let first = nav.viewControllers[0] as! ResultsTableViewController
            first.filterCars = filteredCars
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterSearchController(searchBar: searchBar)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchBar: searchController.searchBar)
    }
    
    //call this function to implement search filters
    func filterSearchController(searchBar: UISearchBar)
    {
        guard let scopeString = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        let selectedType = Car.Make(rawValue: scopeString) ?? .All
        let searchText = searchBar.text ?? ""
        
        // filter cars by element and text, using the computed enum property to get scopes
        filteredCars = cars.filter
            {
                car in
                let isElementMatching = (selectedType == .All) || (car.make == selectedType)
                let isMatchingSearchText = (car.brand?.lowercased().contains(searchText.lowercased()))! || searchText.lowercased().characters.count == 0
                return isElementMatching && isMatchingSearchText
        }
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? filteredCars.count : cars.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        
        // Configure the cell...
        let car = searchController.isActive ? filteredCars[indexPath.row] : cars[indexPath.row]
        
        
        cell.carImage.image = car.image
        cell.name.text = car.name
        cell.brand.text = car.brand
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
