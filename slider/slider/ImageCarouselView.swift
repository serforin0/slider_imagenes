//
//  ImageCarouselView.swift
//  slider
//
//  Created by Py-N on 6/27/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI
import Combine

struct ImageCarouselView<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content
    
     @State private var currentIndex: Int = 0
        private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

        init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
            self.numberOfImages = numberOfImages
            self.content = content()
        }

        var body: some View {
            GeometryReader { geometry in
                
                ZStack(alignment: .bottom) {
                    HStack(spacing: 0) {
                        self.content
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                        .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
                        .animation(.spring())
                        .onReceive(self.timer) { _ in
                            self.currentIndex = (self.currentIndex + 1) % (self.numberOfImages == 0 ? 1 : self.numberOfImages)
                    }
                    
                    
                    HStack(spacing: 3) {
                        
                        ForEach(0..<self.numberOfImages, id: \.self) { index in
                             
                            Circle()
                                .frame(width: index == self.currentIndex ? 10 : 8,
                                       height: index == self.currentIndex ? 10 : 8)
                                .foregroundColor(index == self.currentIndex ? Color.blue : .white)
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                .padding(.bottom, 8)
                                .animation(.spring())
                        }
                    }
                }
            }
        }
    }


