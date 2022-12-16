//
//  HotSalesDataModel.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation

struct HotSalesDataModel: Hashable, Decodable {
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: String
}
