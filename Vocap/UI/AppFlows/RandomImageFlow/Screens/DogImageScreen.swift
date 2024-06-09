//
//  DogImageScreen.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import Foundation
import SwiftUI

struct DogImageScreen: View {
    let image: DogImage
    
    @State private var state: LoadingState<DogImage, DogImageResouce>
    
    @Environment(\.appActions.dogImage) private var dogImageActions
    
    init(image: DogImage) {
        self.image = image
        self._state = State(initialValue: .init(input: image))
    }
    
    var body: some View {
        VStack {
            Group {
                switch state.state {
                case .inProgress:
                    ProgressView()
                case let .error(error):
                    Text(error.localizedDescription)
                case let .completed(resource):
                    DogImageView(resource: resource)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 8) {
                Button {
                    state = .init(input: image)
                } label: {
                    Label("Reload", systemImage: "arrow.triangle.2.circlepath")
                }
                .buttonStyle(.borderedProminent)
                .disabled(state.didFinish == false)
                
                DogImageFavoriteButton(resource: state.value)
                    .id(state.value?.remoteURL)
            }
            .padding()
        }
        .task(id: state.id) {
            guard !state.didFinish else { return }
            
            do {
                let resource = try await dogImageActions.getImage(state.input)
                self.state.state = .completed(resource)
            } catch is CancellationError {
                
            } catch {
                self.state.state = .error(error)
            }
        }
        .onChange(of: image, {
            state = .init(input: image)
        })
    }
}

#Preview {
    WithMockContainer(.app) { container in
        DogImageScreen(image: .random)
    }
}
