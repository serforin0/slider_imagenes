//
//  RepositoryImg.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import Foundation

class RepositoriImg {
    
    typealias imgCallBack =  ([ApiObjectImg]?, _ status: Bool, _ message: String) -> Void
    
    let apiRest = ApiRestServices(urlServer: "https://raw.githubusercontent.com/dotnet-presentations/ContosoCrafts/master/src/wwwroot/data/products.json")
    
    func fechimg( callBack:imgCallBack?) {
        
            apiRest.getStats{ (apiObjectImg) in
                guard let data = apiObjectImg else {
                    callBack?(nil, false, "")
                    return
                }
                callBack?(data, true, "")
            }
        }
    
}
