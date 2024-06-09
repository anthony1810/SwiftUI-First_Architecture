//
//  VocapApp.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import SwiftUI

@main
struct VocapApp: App {
    
    static var configuration: LiveAppContainer.Configuration {
        .init(domainURL: .init(string: "https://dog.ceo/api")!)
    }
    
    @State var container = LiveAppContainer(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            container.app
        }
    }
}
