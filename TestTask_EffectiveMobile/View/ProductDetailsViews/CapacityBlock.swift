//
//  CapacityBlock.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct CapacityBlock: View {
    
    var capacities: [String]
    @Binding var selectedCapacity: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(capacities.count)))]) {
                ForEach(capacities, id: \.self) { item in
                    Button{
                        selectedCapacity = item
                    } label: {
                        Text(item)
                            .foregroundColor( selectedCapacity == item ? .white : Color.init(hex: "#8D8D8D"))
                    }
                    .fontWeight(Font.Weight.bold)
                    .frame(width: 70, height: 30, alignment: .center)
                    .background(selectedCapacity == item ? Color.init(hex: "#FF6E4E") : .white)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
                }
            }
        }
        .padding(.trailing, 30)
    }
}
