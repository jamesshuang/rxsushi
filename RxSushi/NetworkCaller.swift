//
//  NetworkCaller.swift
//  RxSushi
//
//  Created by Justin Wright on 2/4/17.
//  Copyright © 2017 Justin Wright. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

import RealmSwift

class NetworkCaller {
    
    func getSushi(){
        Alamofire.request(NetworkRouter.getSushi).validate().responseJSON{ response in
            guard let value = response.result.value, response.result.isSuccess else {
                print("Error!")
                print(response.debugDescription)
                return
            }
            
            globalMainQueue.async {
                let json = JSON(value)
                let parser = JSONParser()
                let sushi = parser.parse(sushi: json)
                let realm = try! Realm()
                try! realm.write {
                    realm.add(sushi)
                }
            }
            
        }
    }
}
