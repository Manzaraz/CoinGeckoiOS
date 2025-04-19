//
//  URLSessionErrorResolver.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 18/04/2025.
//

import Foundation

class URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode != 429 else {
            return .tooManyRequests
        }
        guard statusCode < 500 else {
            return .clientError
        }

        return .serverError
    }
    
    func resolve(error: Error) -> HTTPClientError {
        return .generic
    }
}
