//
//  ApiRestServices.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import Foundation
import Alamofire


class ApiRestServices {
    
    private var urlServer: String
    private var manager: Session
    
    init(urlServer: String) {
        self.urlServer = urlServer
        
        let configuration: URLSessionConfiguration = {
            let config =  URLSessionConfiguration.default
            
            return config
        }()
        
        self.manager = Session(configuration: configuration)
        
    }
    
    func getStats(completionHandler: @escaping([ApiObjectImg]?) -> Void) {
        let urlService = "products.json"
        request(urlService: urlService, completionHandler: completionHandler)
    }
    
    
    private func request<T:Codable>(urlService: String, decoder: JSONDecoder = JSONDecoder(),  completionHandler: @escaping(T?) -> Void ) {
        
        manager.request("\(self.urlServer)").validate().responseDecodable(of: T.self, decoder: decoder) { response in
            switch response.result {
                case .success(let value):
                      completionHandler(value)
                case .failure(let error): print(error)
            }
        }
        
    }
}
