//
//  BestSellerData.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 08.12.2022.
//

import Foundation

struct BestSellerDataModel: Hashable, Decodable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
}


