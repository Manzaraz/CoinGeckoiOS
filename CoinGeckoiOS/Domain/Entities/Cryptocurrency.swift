//
//  Cryptocurrency.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

struct Cryptocurrency {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let price24h: Double?
    let volume24h: Double?
    let marketCap: Double
}


// * Tanto price24h y volume24h son opcionales, pues puede que la cryptomoneda sea nueva y por lo tanto no tengamos esos registros.
