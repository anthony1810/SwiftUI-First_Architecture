//
//  RealmFavoriteItem.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import RealmSwift

final class RealmFavoriteItem: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var urlString: String
    
    convenience init?(entity: FavoriteItem) {
        guard case let .remote(url) = entity.resource
        else { return nil }
        
        self.init()
        
        id = entity.id
        urlString = url.absoluteString
    }
}

extension FavoriteItem {
    init(realmObject: RealmFavoriteItem) {
        self.init(
            id: realmObject.id,
            resource: URL(string: realmObject.urlString).map { .remote($0) } ?? .placeHolder
        )
    }
}

