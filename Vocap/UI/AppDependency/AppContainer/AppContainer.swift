//
//  AppContainer.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
import SwiftUI

protocol AppContainer: DependencyContainer {
    var app: AppDependency { get }
    
    associatedtype ConcreteFavoritesScreenFactory: FavoritesScreenFactory
    func makeFavoritesScreenFactory() -> ConcreteFavoritesScreenFactory
}

extension AppContainer {
    public func inject(content: Content) -> some View {
        content
            .dependency(app)
    }
    
    public var app: some View {
        TabbarFlow(container: self)
    }
}
