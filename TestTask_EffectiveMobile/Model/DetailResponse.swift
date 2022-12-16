//
//  DetailResponse.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation

struct DetailResponse: Hashable, Decodable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
