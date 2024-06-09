//
//  RandomImageFlow.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import SwiftUI

struct RandomImageFlow<Container: AppContainer>: View {
    
    let container: Container
    var body: some View {
        _Content(flow: self)
    }
}

private struct _Content<Container: AppContainer>: View {
    
    let flow: RandomImageFlow<Container>
    
    var body: some View {
        NavigationStack {
            DogImageScreen(image: .random)
                .navigationTitle("Random Dog")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        RandomImageFlow(container: container)
    }
}

