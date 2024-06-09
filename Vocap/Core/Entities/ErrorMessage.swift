//
//  ErrorMessage.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

struct ErrorMessage: LocalizedError {
    let message: String
    init(message: String) {
        self.message = message
    }
    var errorDescription: String? {
        message
    }
}

extension Error where Self == ErrorMessage {
    static func message(_ message: String) -> Self {
        .init(message: message)
    }
}
