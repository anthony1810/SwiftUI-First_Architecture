//
//  DogImageResource.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
import SwiftUI

enum DogImageResouce {
    case local(Image)
    case remote(URL)
    case placeHolder
    
    var remoteURL: URL? {
        if case let .remote(url) = self {
            url
        } else {
            nil
        }
    }
}

extension DogImageResouce {
    static var mock: Self {
        .local(Image(.kurosuke01))
    }
}

