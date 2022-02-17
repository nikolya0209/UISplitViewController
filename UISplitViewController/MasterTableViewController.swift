//
//  MasterTableViewController.swift
//  UISplitViewController
//
//  Created by MacBookPro on 16.02.2022.
//

import UIKit

protocol FoodObjectsDelegate: AnyObject {
    func foodObjectSelected(foodObject: FoodModel)
}

class MasterTableViewController: UITableViewController {

    var food = FoodModel.fetchFood()
    
    weak var delegate: FoodObjectsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
        delegate?.foodObjectSelected(foodObject: currentFood)
        if let detailVC = delegate as? DetailViewController, let detailNavigationController = detailVC.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
}
