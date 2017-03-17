//
//  SushiCell.swift
//  RxSushi
//
//  Created by James Huang on 3/15/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class SushiCell: UITableViewCell {
    static let Identifier = "SushiCell"
    
    @IBOutlet weak var sushiName: UILabel!
    @IBOutlet weak var sushiPrice: UILabel!
    
    func configureSushi(sushi: Sushi) {
        sushiName.text = sushi.name
        sushiPrice.text = "\(sushi.price)"
    }
    
}
