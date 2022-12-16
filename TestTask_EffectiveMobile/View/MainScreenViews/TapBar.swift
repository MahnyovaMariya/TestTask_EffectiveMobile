//
//  TapBar.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct TapBar: View {
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: UIScreen.main.bounds.size.width, height: 72, alignment: .center)
                    .foregroundColor(Color.init(hex: "#010035"))
                HStack {
                    Spacer()
                    Text("•")
                        .font(Font.largeTitle)
                        .foregroundColor(.white)
                    Text("Explorer")
                        .font(Font.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: MyCart(selectedProduct: DetailResponse(CPU: "", camera: "", capacity: [], color: [], id: "", images: [], price: 0, rating: 0.0, sd: "", ssd: "", title: ""))) {
                        Image("outline_shopping_bag_white_24pt")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image("outline_favorite_border_white_24pt")
                        .foregroundColor(.white)
                    Spacer()
                    Image("outline_perm_identity_white_24pt")
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}

struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TapBar()
    }
}
