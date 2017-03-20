//
//  SushiDetailViewController.swift
//  RxSushi
//
//  Created by James Huang on 3/16/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import UIKit

class SushiDetailViewController: UITableViewController {
    var sushi: Sushi!
    
    @IBOutlet weak var sushiIngredientsLabel: UILabel!
    @IBOutlet weak var sushiPriceLabel: UILabel!
    @IBOutlet weak var sushiNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sushiNameLabel.text = sushi.name
        sushiPriceLabel.text = "$\(sushi.price)"
        sushiIngredientsLabel.text = sushi.ingredients
        title = "Details"
    }
}
