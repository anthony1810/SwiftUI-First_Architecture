//
//  LiveAppContainer.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import SwiftUI
import RealmSwift

final class LiveAppContainer: AppContainer {
    struct Configuration {
        let domainURL: URL
        let realmConfig = RealmConfigurator.makeDefaultConfiguration()
        
        init(domainURL: URL) {
            self.domainURL = domainURL
        }
    }
    
    // App Configurations
    let configuration: Configuration
    
    // Dependencies
    var app: AppDependency
    
    // Infrastructure
    let api: APIClient
    
    // Services
    let dogImageService: DogImageService
    let favoriteService: FavoritesService
    
    init(configuration: Configuration) {
        self.configuration = configuration
        
        self.app = .init()
        
        self.api = .init(
            session: .shared,
            configuration: .init(baseURL: configuration.domainURL)
        )
        
        self.dogImageService = .init(api: self.api)
        self.favoriteService = .init(realmConfiguration: configuration.realmConfig, errorState: app.state.errorAlert)
        
        self.app.actions.dogImage.getImage = self.dogImageService.getImage(_:)
        
        self.app.actions.favorites.connect = self.favoriteService.connect(state:resource:)
        self.app.actions.favorites.favorite = self.favoriteService.favorite(resource:)
        self.app.actions.favorites.unfavorite = self.favoriteService.unfavorite(resource:)
        self.app.actions.favorites.reset = self.favoriteService.reset
    }
    
    func makeFavoritesScreenFactory() -> some FavoritesScreenFactory {
        RealmFavoritesScreenFactory(realmConfiguration: configuration.realmConfig)
    }
}

