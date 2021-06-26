//
//  RepositoryImg.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import Foundation

class RepositoriImg {
    
    typealias imgCallBack = ([ApiObjectImg]?, _ status: Bool, _ message: String) -> Void
    var callBack:imgCallBack?
    let apiRest = ApiRestServices(urlServer: "https://raw.githubusercontent.com/dotnet-presentations/ContosoCrafts/master/src/wwwroot/data/products.json")
    
    func fechimg() {
            apiRest.getStats{ (apiObjectImg) in
                guard let data = apiObjectImg else {
                    self.callBack?(nil, false, "")
                    return
                }
                self.callBack?(data, true, "")
            }
        }
    
}
