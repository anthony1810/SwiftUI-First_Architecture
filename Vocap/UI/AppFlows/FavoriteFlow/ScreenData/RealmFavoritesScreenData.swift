//
//  RealmFavoritesScreenData.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import SwiftUI
import RealmSwift

struct RealmFavoritesScreenData: FavoritesScreenData {
    @ObservedResults(RealmFavoriteItem.self) var items
    
    func item(_ item: Item) -> FavoriteItem {
        .init(realmObject: item)
    }
}
