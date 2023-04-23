//
//  CryptoModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Emir Türk on 7.04.2023.
//

import Foundation

struct CryptoModel : Hashable, Identifiable, Decodable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String,CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
