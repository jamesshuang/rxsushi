//
//  JSONParser.swift
//  RxSushi
//
//  Created by Justin Wright on 2/4/17.
//  Copyright © 2017 Justin Wright. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONParser {
    func parse(sushi json: JSON) -> [Sushi]{
        var sushi: [Sushi] = [Sushi]()
        
        let array = json["sushi"].arrayValue
        
        for rolls in array {
            let type = rolls["type"].stringValue
            
            let sushiRolls: [Sushi] = rolls["rolls"].arrayValue.flatMap{ json in
                let id = json["id"].stringValue
                let name = json["name"].stringValue
                let price = json["price"].doubleValue
                let priority = json["priority"].intValue
                let ingredients = json["ingredients"].stringValue
                return Sushi.create(id: id, name: name, price: price, priority: priority, ingredients: ingredients, type: type)
            }
            
            sushi.append(contentsOf: sushiRolls)
        }
        return sushi
    }
}

