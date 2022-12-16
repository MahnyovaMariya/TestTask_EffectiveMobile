//
//  DetailDataLoader.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation
import Combine

class DetailDataLoader {
    
    func getDetailResponse() -> AnyPublisher<DetailResponse, Error> {
        let components = URLComponents(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")!
        let request = URLRequest(url: components.url!)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: DetailResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
