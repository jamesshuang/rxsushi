//
//  NetworkRouter.swift
//  RxSwift
//
//  Created by Justin Wright on 2/4/17.
//  Copyright © 2017 Justin Wright. All rights reserved.
//

import Alamofire
import Foundation

enum NetworkRouter : URLRequestConvertible {
    
    static let baseUrl = "https://private-6d7be-sushilist.apiary-mock.com"
    static let GET = Alamofire.HTTPMethod.get.rawValue
    static let POST = Alamofire.HTTPMethod.post.rawValue
    
    case getSushi
    
    func asURLRequest() throws -> URLRequest {
        let(httpMethod, path, params): (String, String, [String : Any]?) = {
            switch self {
            case .getSushi:
                return(NetworkRouter.GET, "sushi", nil)
            }
        }()
        
        
        let url = Foundation.URL(string: NetworkRouter.baseUrl)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod
        urlRequest = try! JSONEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}
