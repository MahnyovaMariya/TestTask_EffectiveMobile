//
//  ViewModel.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 12.12.2022.
//

import Foundation
import Combine

class ContentViewViewModel: ObservableObject {

    @Published var bestSellerData = [BestSellerDataModel]()
    @Published var hotSalesData = [HotSalesDataModel]()
    var cancellable: AnyCancellable?

    func loadData() {
        cancellable = DataLoader().getResponse()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("finished")
                }
            } receiveValue: { bSellerData in
                for elem in bSellerData.best_seller {
                    self.bestSellerData.append(elem)
                }
                for elem in bSellerData.home_store {
                    self.hotSalesData.append(elem)
                }
            }
    }
}
