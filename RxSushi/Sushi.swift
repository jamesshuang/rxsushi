//
//  Sushi.swift
//  RxSushi
//
//  Created by James Huang on 3/13/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import RealmSwift

enum SushiType : String {
    case luxe = "Luxe Rolls"
    case signature = "Signature Rolls"
    case special = "Special Rolls"
    case undefined
}

class Sushi : Object {
    
    static let sushi: [Sushi] = {
        var one = Sushi()
        one.name = "first"
        one.price = 1.0
        
        var two = Sushi()
        two.name = "two"
        two.price = 2.0
        
        
        return [one, two]
    }()
    
    dynamic var id: String = UUID().uuidString
    dynamic var ingredients: String = ""
    dynamic var name: String = ""
    dynamic var price: Double = 0.00
    dynamic var priority: Int = 0
    dynamic var _type: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func create(id: String, name: String, price: Double, priority: Int, ingredients: String, type: String) -> Sushi {
        let object = Sushi()
        object.id = id
        object.name = name
        object.price = price
        object.priority = priority
        object.ingredients = ingredients
        object._type = type
        
        return object
    }

    var type: SushiType {
        return SushiType(rawValue: _type) ?? .undefined
    }
}

struct SushiData {
    let luxe: [Sushi]
    let signature: [Sushi]
    let special: [Sushi]
    
    var isEmpty: Bool {
        return luxe.isEmpty && signature.isEmpty && special.isEmpty
    }
    
    var allSushi: [[Sushi]] {
        return [self.special, self.signature, self.luxe]
    }
    
    func titleForSection(section: Int) -> String {
        var title: String
        switch section {
        case 0:
            title = SushiType.special.rawValue
        case 1:
            title = SushiType.signature.rawValue
        case 2:
            title = SushiType.luxe.rawValue
        default:
            title = SushiType.undefined.rawValue
        }
        return title
    }
}

