//
//  FavoritesScreenData.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import SwiftUI

protocol FavoritesScreenData: DynamicProperty {
    
    typealias Item = Items.Element
    associatedtype Items: RandomAccessCollection where Item: Identifiable
    
    var items: Items { get }
    func item(_ item: Item) -> FavoriteItem
}

struct MockFavoritesScreenData: FavoritesScreenData {
    let items: [FavoriteItem]
    
    func item(_ item: Item) -> FavoriteItem {
        item
    }
}
