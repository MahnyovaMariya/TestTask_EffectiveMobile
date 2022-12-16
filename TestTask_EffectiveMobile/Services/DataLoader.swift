//
//  BestSellerDataLoader.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 08.12.2022.
//

import Foundation
import Combine

class DataLoader {
    
    func getResponse() -> AnyPublisher<Response, Error> {
        let components = URLComponents(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")!
        let request = URLRequest(url: components.url!)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


    
