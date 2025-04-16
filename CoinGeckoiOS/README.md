#  Casos de Uso
## Mostrar una lista de cryptomonedas globales

Como usuario, pretendo poder consultar las crypto globales ordenadas por capitalización de mercado (Market Cap)

    - GIVEN: Tengo la App iniciada
    - WHEN: Accedo a la vista de global
    - THEN: Veo un listado de crypto globales.
    - AND: Información básica de cada crypto (nombre, symbol, precio, cambio de precio de las últimas 24hs, Volumen de las últimas 24hs, Capitalizción de mercado)
    
Lo primero que vamos a hacer es identificar nuestro Dominio (nuestras Entities) y las propiedades que le van a interesar al negocio.

    - Entities:
        Cryptocurrencies
            id
            name
            symbol
            price
            price24h
            volume24h
            marketCap
            
    - Use Cases:
        getGlobalCryptoList
        
        


