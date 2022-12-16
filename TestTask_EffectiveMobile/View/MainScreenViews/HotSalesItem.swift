//
//  HotSalesItem.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct HotSalesItem: View {
    
    var picture: String
    var is_new: Bool?
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: picture)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250, alignment: .center)
                VStack {
                    HStack {
                        if is_new ?? false {
                            Image("new")
                            Spacer()
                        }
                    }
                    .padding(.leading, 20)
                    HStack {
                        Text(title)
                            .font(.system( size: 25))
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    HStack {
                        Text(subtitle)
                            .font(Font.caption)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    HStack {
                        Button {
                            print("")
                        } label: {
                            NavigationLink(destination: ProductDetails()) {
                                Text("Buy now!")
                                    .font(Font.caption)
                                    .foregroundColor(Color.init(hex: "#010035"))
                                    .padding([.top, .bottom], 2)
                                    .padding([.leading, .trailing], 15)
                            }
                        }
                        .background(.white)
                        .cornerRadius(3)
                        Spacer()
                    }
                    .padding(.leading, 20)
                }
                .padding([.top, .bottom], 10)
            }
        }
        .padding(10)
    }
}
