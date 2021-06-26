//
//  ApiObjectImg.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import Foundation

struct ApiObjectImg : Codable, Identifiable {
    
    var id: String
    var Maker: String
    var img: String
    var Url: String
    var Title: String
    var Description: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "Id", Maker = "Maker",  img = "img", Url = "Url", Title = "Title", Description = "Description"
    }
  
}
