//
//  DetailViewController.swift
//  UISplitViewController
//
//  Created by MacBookPro on 16.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var foodObject: FoodModel? {
        didSet {
            set()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func set() {
        loadViewIfNeeded()
        foodImageView.image = foodObject?.mainImage
        foodNameLabel.text = foodObject?.foodName
        costLabel.text = "\(foodObject?.cost ?? 0)$"
        descriptionTextView.text = foodObject?.smallDescription
    }
}

extension DetailViewController: FoodObjectsDelegate {
    func foodObjectSelected(foodObject: FoodModel) {
        self.foodObject = foodObject
    }
}
