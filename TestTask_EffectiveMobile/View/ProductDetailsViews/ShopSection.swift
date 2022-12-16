//
//  ShopSection.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 14.12.2022.
//

import SwiftUI

struct ShopSection: View {
    
    @Binding var selectedButton: String
    var item: String
    
    var body: some View {
        VStack {
            Button {
                selectedButton = item
            } label: {
                Text(item)
                    .fontWeight(selectedButton == item ? .bold :  SwiftUI.Font.Weight.light)
            }
            .font(Font.title3)
            .foregroundColor(selectedButton == item ? Color.init(hex: "#010035") : Color.init(hex: "#000000"))
            .padding([.leading, .trailing], 30)
            Rectangle()
                .frame(width: 100, height: 3, alignment: .center)
                .foregroundColor(selectedButton == item ? Color.init(hex: "#FF6E4E") : .white)
                .padding(.top, -10)
        }
    }
}
