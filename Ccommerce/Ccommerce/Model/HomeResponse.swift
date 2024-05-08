//
//  HomeResponse.swift
//  Ccommerce
//
//  Created by SUNG on 5/7/24.
//

import Foundation

struct HomeResponse: Decodable {
    let banners: [Banner]
    let horizontalProducts: [Product]
    let verticalProducts: [Product]
    let themes: [Themes]
}

struct Banner: Decodable {
    let id: Int
    let imageUrl: String
}

struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}

struct Themes: Decodable {
    let id: Int
    let imageUrl: String
}
