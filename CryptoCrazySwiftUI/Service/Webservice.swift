//
//  Webservice.swift
//  CryptoCrazySwiftUI
//
//  Created by Emir Türk on 7.04.2023.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL) async throws -> [CryptoModel] {
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data)
        
        return currencies ?? []
    }
    
}
