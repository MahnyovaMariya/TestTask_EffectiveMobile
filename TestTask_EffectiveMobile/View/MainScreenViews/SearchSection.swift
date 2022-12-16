//
//  SearchSection.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct SearchSection: View {
    @State private var str = ""
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Image("outline_search_black_24pt")
                        .foregroundColor(Color.init(hex: "#FF6E4E"))
                        .frame(minWidth: 24, maxWidth: 72, minHeight: 24, maxHeight: 72)
                    Spacer()
                }
                
                
                TextField("Search", text: $str)
                
                    .padding([.top, .bottom], 10)
                    .padding(.leading, 50)
                    .font(Font.custom("Mark Pro", size: 13, relativeTo: SwiftUI.Font.TextStyle.callout))
                    .foregroundColor(Color.init(hex: "#010035"))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white))
                    .padding(10)
                
            }
            
            Image("img")
        }.padding([.leading, .trailing], 30)
    }
}

struct SearchSection_Previews: PreviewProvider {
    static var previews: some View {
        SearchSection()
    }
}
