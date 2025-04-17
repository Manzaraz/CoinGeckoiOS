//
//  GlobalCryptoListRepositoryType.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

protocol GlobalCryptoListRepositoryType {
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptocurrencyDomainError>
}
