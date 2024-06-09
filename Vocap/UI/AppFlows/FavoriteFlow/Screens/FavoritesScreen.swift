//
//  FavoritesScreen.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import SwiftUI

struct FavoritesScreen<Factory: FavoritesScreenFactory>: View {
    
    let factory: Factory
    
    @AppStorage(SettingsKey.Favorites.prefersFill) var prefersFill = false
    
    @State private var selectedItem: FavoriteItem? = nil
    @State private var selectedItemString: String? = nil
    @Namespace private var selectedImageNamespace
    
    var body: some View {
        WithProperty(factory.makeScreenData()) { screenData in
            if screenData.items.isEmpty {
                ContentUnavailableView("No Favorites", systemImage: "star")
                    .symbolVariant(.slash.fill)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                        ForEach(screenData.items) { item in
                            FavoritesGridItem(item: screenData.item(item))
                                .matchedGeometryEffect(id: item.id, in: selectedImageNamespace)
                                .onTapGesture {
                                    selectedItem = screenData.item(item)
                                    selectedItemString = screenData.item(item).resource.remoteURL?.absoluteString
                                }
                        }
                    }
                }
                .overlay(overlayContent)
                .animation(.default, value: selectedItemString)
            }
        }
        .toolbar(content: {
            leftToolBarContent
        })
    }
    
    var leftToolBarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
                prefersFill.toggle()
            }, label: {
                Label(
                    prefersFill ? "Fit" : "Fill",
                    systemImage: prefersFill
                    ? "arrow.down.right.and.arrow.up.left"
                    : "arrow.up.left.and.arrow.down.right"
                )
            })
        }
    }
    
    var overlayContent: some View {
        Group {
            if let aSelectedItem = selectedItem {
                FavoritesGridItem(item: aSelectedItem)
                    .matchedGeometryEffect(id: aSelectedItem.id, in: selectedImageNamespace)
                    .background(Material.thin)
                    .animation(.easeInOut, value: selectedItemString)
                    .onTapGesture {
                        selectedItem = nil
                        selectedItemString = nil
                    }
            } else {
                Color.clear
            }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesScreen(factory: container.makeFavoritesScreenFactory())
    }
}
