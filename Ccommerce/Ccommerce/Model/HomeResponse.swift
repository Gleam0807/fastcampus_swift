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

struct Themes: Decodable {
    let id: Int
    let imageUrl: String
}
