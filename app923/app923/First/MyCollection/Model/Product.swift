//
//  Product.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct Product: Identifiable, Hashable, Codable{
    let id = UUID()
    var name: String
    var brand : String
    var price : Double
    var isPopular = false
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, brand, price, isPopular
    }
    
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
}
