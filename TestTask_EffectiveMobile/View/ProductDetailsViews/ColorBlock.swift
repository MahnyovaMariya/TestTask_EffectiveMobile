//
//  ColorBlock.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct ColorBlock: View {
    
    var colors: [String]
    @Binding var selectedColor: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(colors.count)))]) {
                    ForEach(colors, id: \.self) { item in
                            Button{
                                selectedColor = item
                            } label: {
                                Image("baseline_done_black_24pt")
                                    .foregroundColor(selectedColor == item ? .white : Color.init(hex: item))
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.init(hex: item))
                            .clipShape(Circle())
                            .padding(.trailing, 10)
                    }
            }
        }
        .padding(.leading, 30)
    }
}
