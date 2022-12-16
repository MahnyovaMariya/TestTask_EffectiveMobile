//
//  FilterBlock.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 14.12.2022.
//

import SwiftUI

struct FilterBlock: View {
    
    var nameBlock: String
    var arrayItems: [String]
    
    var body: some View {
        VStack {
            HStack {
                Text(nameBlock)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#010035"))
                    .padding([.top, .bottom], 10)
                Spacer()
            }
            .padding(.leading, 30)
            Menu {
                ForEach(0..<arrayItems.count){item in
                    Button {
                        print("")
                    } label: {
                        Text(arrayItems[item])
                    }
                }
            } label: {
                HStack {
                    Text(arrayItems[0])
                        .foregroundColor(Color(hex: "#010035"))
                        .padding([.top, .bottom], 10)
                    Spacer()
                    Image("baseline_expand_more_black_24pt")
                        .foregroundColor(Color(hex: "#B3B3B3"))
                        .padding(.trailing, 10)
                }
            }
            .frame(width: UIScreen.main.bounds.size.width - 100, alignment: .center)
            .padding(.leading, 20)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#DCDCDC")!))
        }
    }
}
