//
//  Product.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
