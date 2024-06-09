//
//  EnvironmentConfiguration.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

enum DevelopmentEnvironment {
    case debug
    case release
    
    static var current: DevelopmentEnvironment {
        #if DEBUG
        return DevelopmentEnvironment.debug
        #else
        return DevelopmentEnvironment.release
        #endif
    }
}

enum ConfigurationKey {
    enum Keys {
        enum api {
            static let key = "API_KEY"
            static let domain = "API_DOMAIN"
        }
    }
    
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let value as T: return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

// MARK: - Key

extension DevelopmentEnvironment {
    static var domain: URL {
        return URL(
            string: try! (ConfigurationKey.value(
                for: ConfigurationKey.Keys.api.domain)
            )
        )!
    }
    
    static var apiKey: String {
        return try! ConfigurationKey.value(
            for: ConfigurationKey.Keys.api.key
        )
    }
    
    var logNetworking: Bool { return DevelopmentEnvironment.current == .debug }
    var enableLogger: Bool { return DevelopmentEnvironment.current == .debug }
}
