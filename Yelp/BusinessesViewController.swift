//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var foodSearch: UISearchBar!
    
    
    var businesses: [Business]!
    
    @IBOutlet weak var businessTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        businessTable.dataSource = self
        foodSearch.delegate = self
        navigationItem.titleView = foodSearch
        businessTable.rowHeight = UITableViewAutomaticDimension
        businessTable.estimatedRowHeight = 120
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
                self.businesses = businesses
            self.businessTable.reloadData()
            }
        )
    
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm(term: "Restaurants", sort: .distance, categories: ["asianfusion", "burgers"]) { (businesses, error) in
                self.businesses = businesses
                 for business in self.businesses {
                     print(business.name!)
                     print(business.address!)
                 }
         }
         */
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil{
            return businesses!.count
        }else{
            return 0
        }
        
    }
    func searchBar(_ foodSearch: UISearchBar, textDidChange searchText: String) {
        Business.searchWithTerm(term: searchText, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.businessTable.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTable.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
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
