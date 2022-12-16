//
//  Response.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation

struct Response: Decodable {
    let best_seller: [BestSellerDataModel]
    let home_store: [HotSalesDataModel]
}
