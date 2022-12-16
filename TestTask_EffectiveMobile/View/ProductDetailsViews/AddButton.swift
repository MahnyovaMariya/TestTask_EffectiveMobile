//
//  AddButton.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct AddButton: View {
    
    var productDetailData: DetailResponse
    
    var body: some View {
        ZStack {
            NavigationLink(destination: MyCart(selectedProduct: productDetailData)) {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 55, alignment: .center)
                    .foregroundColor(Color.init(hex: "#FF6E4E"))
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
            HStack {
                Text("Add to Cart")
                    .foregroundColor(.white).fontWeight(Font.Weight.heavy)
                    .padding(.top, 20)
                    .padding(.leading, 80)
                Spacer()
                Text("$" + String(productDetailData.price))
                    .foregroundColor(.white).fontWeight(Font.Weight.heavy)
                    .padding(.top, 20)
                    .padding(.trailing, 80)
            }
        }
    }
}
