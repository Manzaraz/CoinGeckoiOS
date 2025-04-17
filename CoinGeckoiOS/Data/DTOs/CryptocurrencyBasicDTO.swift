//
//  CryptocurrencyBasicDTO.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

struct CryptocurrencyBasicDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
