//
//  ApiObjectImg.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import Foundation

struct ApiObjectImg : Codable {
    
    
    var Id: String
    var Maker: String
    var img: String
    var Url: String
    var Title: String
    var Description: String
    
    
    enum CodingKeys: String, CodingKey {
        case Id = "Id", Maker = "Maker",  img = "img", Url = "Url", Title = "Title", Description = "Description"
    }
  
}
