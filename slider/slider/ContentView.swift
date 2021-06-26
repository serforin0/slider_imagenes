//
//  ContentView.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var repository = RepositoriImg()
    
    @State var selectTab: Int = 0
    var numrbs = [1,2,3,4,5]
    @State var apiObjectImgs: [ApiObjectImg]? = []
        
    
    var body: some View {
        repository.fechimg(callBack: { (data: [ApiObjectImg]?, status: Bool, message: String) -> () in
            
            if(status){
                self.apiObjectImgs = data
                
            }
            
            
        } )
         return TabView {
            
            ForEach(self.apiObjectImgs ?? []) { load  in
                
                AsyncImage(load.img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(0)
//                Text(load.Id)
            }
        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
