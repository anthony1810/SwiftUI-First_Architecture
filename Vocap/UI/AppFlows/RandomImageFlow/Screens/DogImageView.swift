//
//  DogImageView.swift
//  Vocap
//
//  Created by Anthony Tran on 9/6/24.
//

import SwiftUI

struct DogImageView: View {
    let resource: DogImageResouce
    
    init(resource: DogImageResouce) {
        self.resource = resource
    }
    
    var body: some View {
        switch resource {
        case .local(let image):
            image
                .resizable()
                .scaledToFit()
        case .remote(let uRL):
            AsyncImage(url: uRL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(let error):
                    TaskFailedView(errorDescription: error.localizedDescription)
                @unknown default:
                    ProgressView()
                }
            }
        case .placeHolder:
            EmptyView()
        }
    }
}

#Preview("Local") {
    DogImageView(resource: DogImageResouce.mock)
}

#Preview("Remote") {
    DogImageView(resource: DogImageResouce.remote(URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!))
}
