//
//  DogImageService.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

final class DogImageService {
    private let api: APIClient

    init(api: APIClient) {
        self.api = api
    }

    func getImage(_ image: DogImage) async throws -> DogImageResouce {
        switch image {
        case .random:
            return try .remote(await api.execute(
                API.RandomImageRequest.Single.Get()
            ).message)
        }
    }
}
