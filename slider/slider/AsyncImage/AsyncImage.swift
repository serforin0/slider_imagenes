//
//  AsyncImage.swift
//  slider
//
//  Created by Py-N on 6/27/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ){
            self.placeholder = placeholder()
            self.image = image
            _loader = ObservedObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!).resizable()
            } else {
                placeholder
            }
        }
    }
}
