//
//  AppSettings.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
enum SettingsKey {}

extension SettingsKey {
    enum Welcome {
        static let didShow = "Welcome/didShow"
    }
    enum Favorites {
        static let prefersFill = "Favorites/prefersFill"
    }
}
