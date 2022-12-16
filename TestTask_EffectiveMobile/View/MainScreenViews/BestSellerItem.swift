//
//  BestSellerItem.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct BestSellerItem: View {
    
    var picture: String
    var price_without_discount: Int
    var discount_price: Int
    var title: String
    
//    @State var counter = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: (UIScreen.main.bounds.size.width - 65)/2, height: 227, alignment: .center)
                .foregroundColor(.white)
            ZStack {
                VStack {
                    NavigationLink(destination: ProductDetails()) {
                        AsyncImage(url: URL(string: picture)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: (UIScreen.main.bounds.size.width - 65)/2, height: 170, alignment: .top)
                    }
                    HStack {
                        Text("$" + String(price_without_discount))
                            .font(Font.custom("Mark Pro", size: 16, relativeTo: SwiftUI.Font.TextStyle.caption)).foregroundColor(Color.init(hex: "#010035"))
                        
                        Text("$" + String(discount_price))
                            .font(Font.custom("Mark Pro", size: 10, relativeTo: SwiftUI.Font.TextStyle.caption))
                            .foregroundColor(Color.init(hex: "#CCCCCC"))
                            .strikethrough()
                        Spacer()
                    }.padding(.leading, 30)

                    HStack {
                        Text(title)
                            .font(Font.custom("Mark Pro", size: 10, relativeTo: SwiftUI.Font.TextStyle.caption)).foregroundColor(Color.init(hex: "#010035"))
                        Spacer()
                    }.padding(.leading, 30)
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
                               /* .onTapGesture {
                                    
//                                            for i in 0..<selectedHearts.count {
//                                                if selectedHearts[i].id == bestSellerDataItem.id {
//                                                    selectedHearts[i].isSelected.toggle()
//                                                }
//
//                                            }
                                    
                                    if counter == 0 {
                                        x.toggle()
                                    }
                                    counter += 1
                                    selectedHeart = bestSellerDataItem
                                    if like == false {
                                        like.toggle()
                                    } else {

                                    }
                                }
                            Image("heart")
                                .background(selectedHeart == bestSellerDataItem && x == true ? Color.init(hex: "#FF6E4E") : .white)
 */
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

//struct BestSellerItem_Previews: PreviewProvider {
//    static var previews: some View {
//        BestSellerItem()
//    }
//}
