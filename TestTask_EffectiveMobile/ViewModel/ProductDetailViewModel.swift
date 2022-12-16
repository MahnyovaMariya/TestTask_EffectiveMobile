//
//  ProductDetailViewModel.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import Foundation
import Combine

class ProductDetailViewModel: ObservableObject {
    
    @Published var selectedColor = ""
    @Published var selectedCapacity = ""
    @Published var productDetailData = DetailResponse(CPU: "", camera: "", capacity: [], color: [], id: "", images: [], price: 0, rating: 0.0, sd: "", ssd: "", title: "")
    var cancellable: AnyCancellable?
    
    func loadProductDetailData() {
        cancellable = DetailDataLoader().getDetailResponse()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("finished")
                }
            } receiveValue: { detailData in
                self.productDetailData = detailData
                self.selectedColor = self.productDetailData.color[0]
                self.selectedCapacity = self.productDetailData.capacity[0]
            }
    }
}
