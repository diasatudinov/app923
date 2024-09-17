//
//  CollectionViewModel.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

class CollectionViewModel: ObservableObject {
    
    @Published var products: [Product] = [
    ] {
        didSet {
            saveProduct()
        }
    }
    
    @Published var plannedProducts: [Product] = [
    ] {
        didSet {
            savePlannedProduct()
        }
    }
    
    private let productsFileName = "products.json"
    private let plannedProductsFileName = "plannedProducts.json"
    
    init() {
        loadProduct()
        loadPlannedProduct()
    }
    
    func addProduct(_ product: Product) {
        self.products.append(product)
    }
    
    func addPlannedProduct(_ product: Product) {
        self.plannedProducts.append(product)
    }
    
    func editProduct(_ product: Product, image: UIImage?, name: String, brand: String, price: Double) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].image = image
            products[index].name = name
            products[index].brand = brand
            products[index].price = price
        }
    }
    
    func editPlannedProduct(_ product: Product, image: UIImage?, name: String, brand: String, price: Double) {
        if let index = plannedProducts.firstIndex(where: { $0.id == product.id }) {
            plannedProducts[index].image = image
            plannedProducts[index].name = name
            plannedProducts[index].brand = brand
            plannedProducts[index].price = price
        }
    }
    
    func togglePopular(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isPopular.toggle()
        }
    }
    
    func deleteProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
    func deletePlannedProduct(_ product: Product) {
        if let index = plannedProducts.firstIndex(where: { $0.id == product.id }) {
            plannedProducts.remove(at: index)
        }
    }
    
    func toMyCollection(_ product: Product) {
        if let index = plannedProducts.firstIndex(where: { $0.id == product.id }) {
            plannedProducts.remove(at: index)
            products.append(product)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func productsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(productsFileName)
    }
    
    private func plannedProductsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(plannedProductsFileName)
    }
    
   
    
    private func saveProduct() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.products)
                try data.write(to: self.productsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func savePlannedProduct() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.plannedProducts)
                try data.write(to: self.plannedProductsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadProduct() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: productsFilePath())
            products = try decoder.decode([Product].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    private func loadPlannedProduct() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: plannedProductsFilePath())
            plannedProducts = try decoder.decode([Product].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func totalCollectionPrice() -> Double {
        return products
            .reduce(0) { $0 + $1.price }
    }
    
    func totalPlannedPrice() -> Double {
        return plannedProducts
            .reduce(0) { $0 + $1.price }
    }
    
    func totalPopularPrice() -> Double {
        return products
            .filter { $0.isPopular }
            .reduce(0) { $0 + $1.price }
    }
    
    func averageCost() -> Double {
        let totalPrice = totalCollectionPrice()
        if totalPrice == 0 {
            return 0
        }
        return totalPrice/Double(products.count)
    }

}
