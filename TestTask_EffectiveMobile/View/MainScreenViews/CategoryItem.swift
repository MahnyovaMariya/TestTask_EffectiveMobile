//
//  CategoriesItem.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct CategoryItem: View {
    
    var item: CategoriesData
    @Binding var selected: CategoriesData?
    
    var body: some View {
        VStack {
            ZStack {
                Color(self.selected == item ? UIColor(red: 0.931, green: 0.464, blue: 0.345, alpha: 1) : .white)
                Image(item.image)
                    .padding()
                    .foregroundColor(self.selected == item ? Color.white : Color.init(hex: "#B3B3C3"))
                    .clipShape(Circle())
                    .onTapGesture {
                        selected = item
                    }
            }
            .clipShape(Circle())
            .shadow(color: Color(UIColor(red: 0.702, green: 0.701, blue: 0.761, alpha: 0.3)), radius: 10)
            Text(item.name)
                .font(Font.subheadline)
                .foregroundColor(self.selected == item ? Color.init(hex: "#FF6E4E") : Color.init(hex: "#010035"))
        }
        .padding(10)
    }
}
