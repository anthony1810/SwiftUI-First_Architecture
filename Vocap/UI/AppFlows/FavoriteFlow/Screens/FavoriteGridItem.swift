//
//  FavoriteGridItem.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import SwiftUI

struct FavoritesGridItem: View {
    
    @AppStorage(SettingsKey.Favorites.prefersFill) var prefersFill = false
    
    let item: FavoriteItem
    
    var body: some View {
        DogImageView(resource: item.resource)
            .aspectRatio(contentMode: prefersFill ? .fill : .fit)
            .frame(minWidth: prefersFill ? 0 : nil, maxWidth: prefersFill ? .infinity : nil, minHeight: prefersFill ? 0 : nil, maxHeight: prefersFill ? .infinity : nil)
            .clipShape(.rect(cornerRadius: 4))
            .frame(minWidth: prefersFill ? nil : 0, maxWidth: prefersFill ? nil : .infinity, minHeight: prefersFill ? nil : 0, maxHeight: prefersFill ? nil : .infinity)
            .aspectRatio(1, contentMode: .fill)
            .animation(.default, value: prefersFill)
    }
}

#Preview {
    FavoritesGridItem(item: .mock)
}
