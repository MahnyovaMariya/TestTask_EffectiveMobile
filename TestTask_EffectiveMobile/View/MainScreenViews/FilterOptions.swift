//
//  FilterOptions.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 13.12.2022.
//

import SwiftUI

struct FilterOptions: View {
    
    let blocks = ["Brand", "Price", "Size"]
    let brands = ["Samsung", "Apple", "Xiaomi", "Huawei", "Oppo", "Sony", "Realme", "Motorola", "LG", "OnePlus"]
    let prices = ["0 - $299", "$300 - $499","$500 - $999", "$1000 - $2999", "$3000 - $4999", "$5000 - $10000"]
    let sizes = ["4.5 to 5.5 inches", "5.6 to 6.08 inches", "6.09 to 6.41 inches", "6.43 to 6.73 inches"]
    
    @Binding var isButtonTap: Bool
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.width - 20, alignment: .center)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                VStack {
                    HStack {
                        Button {
                                isButtonTap.toggle()
                        } label: {
                            Image("baseline_clear_black_24pt")
                                .frame(width: 37, height: 37, alignment: .center)
                                .background(Color(hex: "#010035"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        Spacer()
                        Text("Filter options")
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#010035"))
                            .padding(.top, 20)
                        Spacer()
                        Button {
                            print("")
                        } label: {
                            Text("Done")
                                .frame(width: 86, height: 37, alignment: .center)
                                .background(Color(hex: "#FF6E4E"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                        
                    }
                    FilterBlock(nameBlock: "Brand", arrayItems: brands)
                    FilterBlock(nameBlock: "Price", arrayItems: prices)
                    FilterBlock(nameBlock: "Size", arrayItems: sizes)
//                    filterBlock
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.width - 20, alignment: .center)
                
            }
            .opacity(isButtonTap ? 1 : 0)
            .padding(.bottom, 72)
        }
    }
    
//    var filterBlock: some View {
//        VStack {
//            HStack {
//                Text("Brand")
//                    .fontWeight(.bold)
//                    .foregroundColor(Color(UIColor(red: 0.003, green: 0.000, blue: 0.196, alpha: 1)))
//                    .padding([.top, .bottom], 10)
//
//                Spacer()
//            }
//            .padding(.leading, 30)
//
//            Menu {
//                ForEach(0..<brands.count){item in
//                    Button {
//                        print("")
//                    } label: {
//                        Text(brands[item])
//                    }
//                }
//            } label: {
//                HStack {
//                    Text("Samsung")
//                        .foregroundColor(Color(hex: "#010035"))
//                        .padding([.top, .bottom], 10)
//                    Spacer()
//                    Image("baseline_expand_more_black_24pt")
//                        .foregroundColor(Color(hex: "#B3B3B3"))
//                        .padding(.trailing, 10)
//
//                }
//            }
//            .frame(width: UIScreen.main.bounds.size.width - 100, alignment: .center)
//            .padding(.leading, 20)
//            .overlay(RoundedRectangle(cornerRadius: 10)
//                .stroke(Color(hex: "#DCDCDC")!))
//        }
//        .padding(.top, 20)
//    }
}

//struct FilterOptions_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        FilterOptions()
//    }
//}
