//
//  Award.swift
//  app923
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct Award: Identifiable, Hashable, Codable {
    let id = UUID()
    var name: String
    var title : String
    var date : Date
    var isChecked = false
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, title, date, isChecked
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
