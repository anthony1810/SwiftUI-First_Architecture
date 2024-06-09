//
//  AppState+ErrorAlert.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

extension AppStates {
    final class ErrorAlert: ObservableObject {
        @Published var alert: DisplayableError?
        
        init() {}
    }
}
