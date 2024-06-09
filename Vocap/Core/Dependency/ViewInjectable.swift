//
//  ViewInjectable.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation
import SwiftUI

protocol ViewInjectable {
    typealias Content = ViewDependencyModifier<Self>.Content
    associatedtype InjectedBody: View
    
    func inject(content: Content) -> InjectedBody
}

struct ViewDependencyModifier<D: ViewInjectable>: ViewModifier {
    let dependency: D
    
    func body(content: Content) -> some View {
        dependency.inject(content: content)
    }
}

extension View {
    func dependency(_ dependency: some ViewInjectable) -> some View {
        modifier(ViewDependencyModifier(dependency: dependency))
    }
}
