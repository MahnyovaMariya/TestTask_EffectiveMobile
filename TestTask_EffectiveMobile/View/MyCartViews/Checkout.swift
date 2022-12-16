//
//  Checkout.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Checkout: View {
    
    var body: some View {
        Button {
            print("")
        } label: {
            Text("Checkout")
                .foregroundColor(.white).fontWeight(Font.Weight.heavy)
        }
        .frame(width: UIScreen.main.bounds.size.width - 50, height: 55, alignment: .center)
        .background(Color.init(hex: "#FF6E4E"))
        .cornerRadius(10)
        .padding(.top, 20)
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
