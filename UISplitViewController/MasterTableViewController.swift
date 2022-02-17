//
//  MasterTableViewController.swift
//  UISplitViewController
//
//  Created by MacBookPro on 16.02.2022.
//

import UIKit


class MasterTableViewController: UITableViewController {

    var food = FoodModel.fetchFood()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let currentFood = food[indexPath.row]

        cell.textLabel?.text = currentFood.foodName
        cell.imageView?.image = currentFood.mainImage

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentFood = food[indexPath.row]
    }
}
