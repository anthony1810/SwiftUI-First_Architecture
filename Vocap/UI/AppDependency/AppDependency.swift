//
//  AppDependency.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
import SwiftUI

struct AppDependency: Dependency {
    var state: AppStates
    var actions: AppActions
    
    init(state: AppStates, actions: AppActions) {
        self.state = state
        self.actions = actions
    }
    
    init() {
        self.init(state: .init(), actions: .init())
    }
}
