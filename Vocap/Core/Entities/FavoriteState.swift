//
//  FavoriteState.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation

public final class FavoriteState: ObservableObject {
    @Published public var canFavorite = false
    
    @Published public var isFavorited = false
    
    public init() { }
}
