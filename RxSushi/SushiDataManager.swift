//
//  SushiDataManager.swift
//  RxSushi
//
//  Created by James Huang on 3/14/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import RealmSwift

class SushiDataManager {
    let realm = try! Realm()
        
    func fetchData() {
        globalMainQueue.async {
            let realm = try! Realm()
            let allSushi = realm.objects(Sushi.self)
            
            if allSushi.count <= 0 {
                print("calling server")
                let networkCaller = NetworkCaller()
                networkCaller.getSushi()
            }
        }
    }
    
    func fetchAllSushi() -> [Sushi] {
        let sushiResults = realm.objects(Sushi.self)
        
        var allSushi = [Sushi]()
        allSushi.append(contentsOf: sushiResults)
        
        return allSushi
    }
}
