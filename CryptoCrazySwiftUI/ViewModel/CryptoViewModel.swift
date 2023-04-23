//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Emir Türk on 8.04.2023.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    func downloadCryptos(url : URL) async {
        do {
            let cryptos = try await webservice.downloadCurrencies(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
        }
        catch {
            print(error)
        }
    }
    
    
    struct CryptoViewModel {
        
        let crypto : CryptoModel
        var id : UUID? {
            crypto.id
        }
        var currency : String {
            crypto.currency
        }
        var price : String {
            crypto.price
        }
        
    }
}
