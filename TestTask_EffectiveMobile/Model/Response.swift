//
//  Response.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation

struct Response: Decodable {
    var best_seller: [BestSellerDataModel]
    var home_store: [HotSalesDataModel]
}
