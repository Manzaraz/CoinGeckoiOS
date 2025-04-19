//
//  HTTPClient.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 18/04/2025.
//

import Foundation

// Sabemos que el datasource pertenece a la capa de data, por lo tanto no puede incluir detalles de framework (urlSession), por lo tanto necesitamos tener otro componente que se encargue de manejar esa lógica de framework
protocol HTTPClient { // aquí dependemos de algo que se encuentra fuera de nuestra capa, por lo tanto dependemos de otra interface y esa interfaz será implementada por un componente externo que habita en la capa de infraestructura
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}

