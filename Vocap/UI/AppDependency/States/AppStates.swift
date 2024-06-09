//
//  AppState.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation
import SwiftUI

struct AppStates: ViewInjectable {
    var errorAlert = ErrorAlert()
    
    init() { }
    
    func inject(content: Content) -> some View {
        content
            .environmentObject(errorAlert)
    }
}
