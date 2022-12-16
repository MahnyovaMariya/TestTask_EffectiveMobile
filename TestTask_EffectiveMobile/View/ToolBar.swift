//
//  ToolBar.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct ToolBar: View {
    
    var text: String
    var picture: String
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(Color.init(hex: "#010035"))
            if text == "Product Details" {
                Spacer()
            }
            Button {
                print("")
            } label: {
                Image(picture)
                    .frame(width: 37, height: 37, alignment: .center)
                    .background(Color.init(hex: "#FF6E4E"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
            }
        }
    }
}

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ToolBar(text: "Add address", picture: "baseline_fmd_good_black_24pt")
    }
}
