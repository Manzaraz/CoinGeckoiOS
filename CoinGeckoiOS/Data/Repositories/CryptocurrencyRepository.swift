//
//  CryptocurrencyRepository.swift
//  CoinGeckoiOS
//
//  Created by Christian Manzaraz on 16/04/2025.
//

import Foundation

class CryptocurrencyRepository: GlobalCryptoListRepositoryType {
    
    private let apiDataSource: ApiDataSourceType
    private let errorMapper: CryptocurrencyDomainErrorMapper
    private let domainMapper: CryptocurrencyDomainMapper
    
    init(apiDataSource: ApiDataSourceType, errorMapper: CryptocurrencyDomainErrorMapper, domainMapper: CryptocurrencyDomainMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    

    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptocurrencyDomainError> {
        let symbolListResult = await apiDataSource.getGlobalCryptoSymbolList()
        let cryptoListResult = await apiDataSource.getCryptoList()
        
        guard case .success(let symbolList) = symbolListResult else {
            return .failure(errorMapper.map(error: symbolListResult.failureValue as? HTTPClientError))
        }
        
        guard case .success(let cryptoList) = cryptoListResult else {
            return .failure(errorMapper.map(error: cryptoListResult.failureValue as? HTTPClientError))
        }
        
        // * Ahora tenemos que convertir toda la info anterior en la entity (en el modelo de dominio Cryptocurrency)
        let cryptocurrencyBuilderList = domainMapper.getCryptocurrencyBuilderList(symbolList: symbolList, cryptoList: cryptoList)
        
        let priceInfoResult = await apiDataSource.getPriceInfoForCryptos(id: cryptocurrencyBuilderList.map { $0.id })
        
        guard case .success(let priceInfo) = priceInfoResult else {
            return .failure(errorMapper.map(error: priceInfoResult.failureValue as? HTTPClientError))
        }
        
        // * Teninendo en cuenta que la cryptocurrencyBuilderList, sólo tienen 3 valores, ahora tendríamos que completar con el resto de la data de los precios, para ello tendríamos que recorrer esta cryptocurrencyBuilderList y comprobar su id para ver si existe en el diccionario priceInfo y agregar la info faltante
        let cryptocurrency = domainMapper.map(cryptocurrencyBuilderList: cryptocurrencyBuilderList,
                                              priceInfo: priceInfo)
        
        return .success(cryptocurrency)
    }
}
