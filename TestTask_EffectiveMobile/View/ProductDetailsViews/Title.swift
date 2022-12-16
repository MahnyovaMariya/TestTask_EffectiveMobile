//
//  Title.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Title: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(SwiftUI.Font.title)
                .foregroundColor(Color.init(hex: "#010035"))
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.size.width / 10, height: UIScreen.main.bounds.size.width / 10, alignment: .center)
                    .foregroundColor(Color.init(hex: "#010035"))
                Image("outline_favorite_border_white_20pt")
                    .foregroundColor(Color.white)
            }
            .padding([.trailing], 30)
        }
        .padding([.top, .leading], 30)
    }
}
