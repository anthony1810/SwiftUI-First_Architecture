//
//  AppActions.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
import SwiftUI
import OSLog

struct AppActions: ViewInjectable {
    struct Key: EnvironmentKey {
        static let defaultValue = AppActions()
    }
    
    var dogImage = AppActions.DogImageGetter()
    var favorites = AppActions.Favorite()
    
    init() {}
    
    func inject(content: Content) -> some View {
        content
            .environment(\.appActions, self)
    }
}

extension EnvironmentValues {
    var appActions: AppActions {
        get { self[AppActions.Key.self] }
        set { self[AppActions.Key.self]  = newValue }
    }
}
