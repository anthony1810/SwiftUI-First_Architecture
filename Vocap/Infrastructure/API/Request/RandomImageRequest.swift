//
//  RandomImageRequest.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

extension API {
    enum RandomImageRequest {
        enum Single {
            struct Get: APIRequest {
                typealias Message = URL
                
                var path = "breeds/image/random"
                
                var method = "GET"
                
                init() { }
            }
        }
        
        enum Multiple {
            struct Get: APIRequest {
                typealias Message = [URL]
                
                var path: String {
                    "breeds/image/random/\(count)"
                }
                
                var method = "GET"
                
                let count: Int
                
                init(count: Int) {
                    self.count = count
                }
            }
        }
    }
}
