//
//  FavoritesService.swift
//  MVPattern
//
//  Created by Anthony Tran on 4/6/24.
//

import Foundation
import Combine
import SwiftUI
import RealmSwift

class FavoritesService {
    private let realmConfiguration: Realm.Configuration
    private let errorAlert: AppStates.ErrorAlert
    
    init(realmConfiguration: Realm.Configuration, errorState: AppStates.ErrorAlert) {
        self.realmConfiguration = realmConfiguration
        self.errorAlert = errorState
    }
    
    func connect(state: FavoriteState, resource: DogImageResouce) {
        do {
            guard case let .remote(url) = resource else {
                state.canFavorite = false
                return
            }
            
            print("-> connected favorite state to \(url)")
            
            state.canFavorite = true
            let urlString = url.absoluteString
            
            let realm = try Realm(configuration: realmConfiguration)
            
            realm.objects(RealmFavoriteItem.self)
                .where { $0.urlString == urlString }
                .collectionPublisher
                .map { !$0.isEmpty }
                .replaceError(with: false)
                .assign(to: &state.$isFavorited)
        } catch {
            errorAlert.alert = .init(
                underlying: error,
                message: "Could not fetch favorite item"
            )
        }
    }
    
    func favorite(resource: DogImageResouce) {
        do {
            guard let object = RealmFavoriteItem(
                entity: .init(
                    id: .init(),
                    resource: resource
                )
            ) else {
                throw ErrorMessage.message("This image can't be favorite")
            }
            
            let realm = try Realm(configuration: realmConfiguration)
            try realm.write {
                realm.add(object, update: .all)
                print("-> favorited \(object.urlString)")
            }
        } catch {
            errorAlert.alert = .init(underlying: error, message: "could not favorite an image")
        }
    }
    
    func unfavorite(resource: DogImageResouce) {
        do {
            guard case let .remote(url) = resource
            else {
                throw ErrorMessage.message("This image can't be unfavorite")
            }
            
            let realm = try Realm(configuration: realmConfiguration)
            
            let objects = realm.objects(RealmFavoriteItem.self)
                .where { $0.urlString == url.absoluteString }
            
            try realm.write {
                realm.delete(objects)
                print("-> unfavorite \(url.absoluteString)")
            }
        } catch {
            errorAlert.alert = .init(underlying: error, message: "could not unfavorite an image")
        }
    }
    
    func reset() {
        do {
            let realm = try Realm(configuration: realmConfiguration)
            let objects = realm.objects(RealmFavoriteItem.self)
            let count = objects.count
            try realm.write {
                realm.delete(objects)
                print("-> resetted \(count) favorite items")
            }
        } catch {
            errorAlert.alert = .init(
                underlying: error,
                message: "could not reset all favorites"
            )
        }
    }
    
}

