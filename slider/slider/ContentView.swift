//
//  ContentView.swift
//  slider
//
//  Created by Py-N on 6/26/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI


struct ImageOverlay: View {
    private var id: String
    init(id: String) {
        self.id = id
    }
    var body: some View {
        ZStack {
            Text(self.id)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(20)
        
    }
}

struct ContentView: View {
    
    //@ObservedObject var searchObjectController = SearchObjectController.shared
    
    var repository = RepositoriImg()
    
    @State var selectTab: Int = 0
    var numrbs = [1,2,3,4,5]
    @State var apiObjectImgs: [ApiObjectImg] = []
    let url = "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg"
        
 
    
    
    
    var body: some View {
        repository.fechimg(callBack: { (data: [ApiObjectImg]?, status: Bool, message: String) -> () in
            if(status){
                self.apiObjectImgs = data ?? []
            }
        })
        
        return  GeometryReader { geometry in
            ImageCarouselView(numberOfImages: self.apiObjectImgs.count) {
                        ForEach(self.apiObjectImgs) { apiImages in
                         
                           
                                AsyncImage(
                                    url: URL(string: apiImages.img)!,
                                            placeholder: { Text("Loading ...") },
                                            image: { Image(uiImage: $0).resizable() })
                                  .scaledToFill()
                                  .frame(width: geometry.size.width, height: geometry.size.height)
                                  .clipped()
                                    .overlay(ImageOverlay(id: apiImages.id), alignment: .bottom)
                            
                            
                            
                        }
                      }
                  }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
