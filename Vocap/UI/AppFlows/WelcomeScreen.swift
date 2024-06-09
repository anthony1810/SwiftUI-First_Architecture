//
//  WelcomeScreen.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//
import Foundation
import SwiftUI

struct WelcomeScreen: View {
    
    @AppStorage(SettingsKey.Welcome.didShow) var didShow = false
    
    var body: some View {
        VStack(spacing: 64) {
            Text("Welcome")
                .font(.largeTitle.bold())
            
            Text("Thank you for installing this app!")
            
            Button("Show me dogs") {
                didShow = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
