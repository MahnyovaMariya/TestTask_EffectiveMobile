//
//  BestSellerItem.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct BestSellerItem: View {
    
    var bestSellerDataItem: BestSellerDataModel
    @Binding var selectedHeart: BestSellerDataModel?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: (UIScreen.main.bounds.size.width - 65)/2, height: 227, alignment: .center)
                .foregroundColor(.white)
            ZStack {
                VStack {
                    NavigationLink(destination: ProductDetails()) {
                        AsyncImage(url: URL(string: bestSellerDataItem.picture)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: (UIScreen.main.bounds.size.width - 65)/2, height: 170, alignment: .top)
                    }
                    HStack {
                        Text("$" + String(bestSellerDataItem.price_without_discount))
                            .font(Font.callout)
                        Text("$" + String(bestSellerDataItem.discount_price))
                            .font(Font.caption2)
                            .foregroundColor(Color.init(hex: "#CCCCCC"))
                            .strikethrough()
                        Spacer()
                    }
                    .padding(.leading, 30)
                    HStack {
                        Text(bestSellerDataItem.title)
                            .font(Font.caption2)
                        Spacer()
                    }
                    .padding(.leading, 30)
                }
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(color: Color(UIColor(red: 0.702, green: 0.701, blue: 0.761, alpha: 0.6)), radius: 10)
                               .onTapGesture { selectedHeart = bestSellerDataItem }
                            Image("heart")
                                .background(selectedHeart == bestSellerDataItem ? Color.init(hex: "#FF6E4E") : .white)
                        }
                    }
                    Spacer()
                }
                .padding(.top, 5)
                .padding(.trailing, 10)
            }
            .padding()
        }
    }
}
