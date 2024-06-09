//
//  LoadingOperation.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

struct LoadingState<Input, Value>: Identifiable {
    enum State {
        case inProgress
        case completed(Value)
        case error(Error)
    }
    
    let id = UUID()
    let input: Input
    var state = State.inProgress
    
    init(input: Input) {
        self.input = input
    }
    
    var didFinish: Bool {
        switch state {
        case .inProgress: false
        case .completed, .error: true
        }
    }
    
    var value: Value? {
        if case let .completed(value) = state {
            value
        } else {
            nil
        }
    }
}
