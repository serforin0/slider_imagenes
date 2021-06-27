//
//  EnvironmentValues_ImageCache.swift
//  slider
//
//  Created by Py-N on 6/27/21.
//  Copyright © 2021 Py-N. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
