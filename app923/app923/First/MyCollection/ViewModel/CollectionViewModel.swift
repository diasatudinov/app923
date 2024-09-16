//
//  CollectionViewModel.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import Foundation

class CollectionViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func addProduct(_ product: Product) {
        self.products.append(product)
    }
}
