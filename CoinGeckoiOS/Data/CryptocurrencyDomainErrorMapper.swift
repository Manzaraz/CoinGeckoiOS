//
//  CryptocurrencyDomainErrorMapper.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

class CryptocurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptocurrencyDomainError {
        return .generic
    }
}
