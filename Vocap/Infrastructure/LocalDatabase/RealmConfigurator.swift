//
//  RealmConfigurator.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import RealmSwift

struct RealmConfigurator {
    static let schemaVersion: UInt64 = 1
    let configuration: Realm.Configuration
    
    init(configuration: Realm.Configuration = Self.makeDefaultConfiguration()) {
        self.configuration = configuration
    }
    
    static func setup(configuration: Realm.Configuration) {
        Realm.Configuration.defaultConfiguration = makeDefaultConfiguration()
    }
    
    static func makeDefaultConfiguration() -> Realm.Configuration {
        .init(
            schemaVersion: schemaVersion,
            migrationBlock: performMigration
        )
    }
    
    static func performMigration(migration: Migration, oldSchemaVersion: UInt64) {
        
        if oldSchemaVersion < 1  {
            migration.migrateToVersion1()
        }
        
    }
}
