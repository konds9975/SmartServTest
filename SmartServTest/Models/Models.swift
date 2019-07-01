//
//  Models.swift
//  SmartServTest
//
//  Created by Kondya on 01/07/19.
//  Copyright © 2019 Fortune4. All rights reserved.
//

import Foundation

// MARK: - ProductDataModel
struct ProductDataModel: Codable {
    let count: Int
    let products: [String: ProductModel]
}

// MARK: - Product
struct ProductModel: Codable {
    let subcategory: Subcategory
    let title, price, popularity: String
}

enum Subcategory: String, Codable {
    case fitnessTracker = "fitness-tracker"
    case mobile = "mobile"
    case smartWatches = "smart-watches"
    case tablet = "tablet"
}
