//
//  ContentView.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //@ObservedObject var searchObjectController = SearchObjectController.shared
    
    var repository = RepositoriImg()
    
    @State var selectTab: Int = 0
    var numrbs = [1,2,3,4,5]
    @State var apiObjectImgs: [ApiObjectImg] = []
    let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
        
    
    var body: some View {
        repository.fechimg(callBack: { (data: [ApiObjectImg]?, status: Bool, message: String) -> () in
            if(status){
                self.apiObjectImgs = data ?? []
            }
        })
        return List(self.apiObjectImgs, id: \.self) { image in
            return AsyncImage(
                url: image.img,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
