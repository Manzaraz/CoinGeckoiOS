//
//  Foundation+Extensions.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
            case .failure(let error):
                return error
            case .success:
                return nil
        }
    }
}
