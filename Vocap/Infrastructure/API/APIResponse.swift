//
//  APIResponse.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

struct APIResponse<Data: Decodable>: Decodable {
    let message: Data
    let status: String
}
