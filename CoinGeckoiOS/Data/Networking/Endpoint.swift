//
//  Endpoint.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 18/04/2025.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String: Any]
    let method: HTTPMethod
}
