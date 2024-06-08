//
//  VocapApp.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import SwiftUI

@main
struct VocapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(Environment.apiKey)
                }
        }
    }
}
