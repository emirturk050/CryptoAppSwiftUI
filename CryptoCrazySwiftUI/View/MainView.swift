//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Emir Türk on 6.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    var body: some View {
       
        NavigationView {
            List(cryptoListViewModel.cryptoList,id:\.id) { crypto in
                
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.green)
                        //.frame(maxWidth: .infinity , alignment: .leading)
                    
                    Text(crypto.price)
                    //frame(maxWidth: .infinity , alignment: .leading)
                }
                
            }.navigationTitle(Text("CryptoApp"))
        }.task {
            await cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
