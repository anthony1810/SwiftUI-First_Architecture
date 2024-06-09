//
//  TabbarFlow.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct TabbarFlow<Container: AppContainer>: View {
    
    let container: Container
    
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    
  
    @AppStorage(SettingsKey.Welcome.didShow) private var didShowWelcome = false
    
    let flow: TabbarFlow<Container>
    
    var body: some View {
        ZStack {
            if didShowWelcome {
                TabView {
                    RandomImageFlow(container: flow.container)
                        .tabItem {
                            Label("Random", systemImage: "photo")
                        }
                    
                    FavoritesFlow(container: flow.container)
                        .tabItem {
                            
                            Label("Favorites", systemImage: "star")
                        }
                }
                .transition(.asymmetric(insertion: .slide, removal: .scale))
            } else {
                WelcomeScreen()
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
        .animation(.bouncy, value: didShowWelcome)
    }
}

#Preview {
    WithMockContainer(.app) { container in
        TabbarFlow(container: container)
    }
}

