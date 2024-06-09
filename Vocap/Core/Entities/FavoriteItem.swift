//
//  FavoriteItem.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//
import Foundation
import SwiftUI

struct FavoriteItem: Identifiable {
    let id: UUID
    let resource: DogImageResouce
    
    init(id: UUID, resource: DogImageResouce) {
        self.id = id
        self.resource = resource
    }
}

extension FavoriteItem {
    static var mock: Self {
        .init(id: .init(), resource: .mock)
    }
    
    static var mocks: [Self] {
        var mocks = [Self]()
        for _ in 0..<10 {
            mocks.append(mock)
        }
        return mocks
    }
}

extension Sequence where Element == FavoriteItem {
    static var mocks: [FavoriteItem] {
        (0..<10).map { _ in FavoriteItem.mock}
    }
}
