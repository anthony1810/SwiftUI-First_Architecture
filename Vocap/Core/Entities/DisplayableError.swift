//
//  DisplayableError.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Foundation

struct DisplayableError: Identifiable, LocalizedError {
    let id: UUID = .init()
    let underlying: Error?
    let message: String
    
    init(underlying: Error?, message: String) {
        self.underlying = underlying
        self.message = message
    }
    
    var errorDescription: String? {
        message
    }
}
