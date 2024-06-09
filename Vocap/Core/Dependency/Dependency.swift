//
//  Dependency.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation
import SwiftUI

protocol Dependency: ViewInjectable {
    associatedtype State: ViewInjectable
    associatedtype Actions: ViewInjectable
    
    var state: State { get }
    var actions: Actions { get }
}

extension Dependency {
    func inject(content: Content) -> some View {
        content
            .dependency(state)
            .dependency(actions)
    }
}
