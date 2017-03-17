//
//  SushiDetailViewController.swift
//  RxSushi
//
//  Created by James Huang on 3/16/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import UIKit

class SushiDetailViewController: UIViewController {
    var sushi: Sushi!
    
    @IBOutlet weak var sushiNameLabel: UILabel!
    @IBOutlet weak var sushiPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sushiNameLabel.text = sushi.name
        sushiPriceLabel.text = "\(sushi.price)"
    }
}
