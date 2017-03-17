//
//  SushiViewModel.swift
//  RxSushi
//
//  Created by James Huang on 3/14/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import RealmSwift

class SushiViewModel {
    
    let sushiData = SushiDataManager()
    
    var sushiData: [Sushi]!
    
    
    
    func getAllSushi() -> [Sushi] {
        return sushiData.fetchAllSushi()
    }
    
    func deleteRealm() {
        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        let realmURLs = [
            realmURL,
            realmURL.appendingPathExtension("lock"),
            realmURL.appendingPathExtension("note"),
            realmURL.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            do {
                try FileManager.default.removeItem(at: URL)
            } catch {
                // handle error
            }
        }
    }
    
}
