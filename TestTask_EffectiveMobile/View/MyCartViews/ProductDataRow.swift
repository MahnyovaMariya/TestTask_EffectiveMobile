//
//  ProductDataRow.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct ProductDataRow: View {
    
    var id: String
    var urlString: String
    var title: String
    var price: Int
    
    @Binding var selectedProducts: [DetailResponse]
    @Binding var total: Int
    
    @State var productCounter = 1
    @State var productPrice = 0
    
    var body: some View {
        
        
            HStack {
                AsyncImage(url: URL(string: urlString)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 111, height: 89, alignment: .center)
                .padding(.leading, 23)
                VStack {
                    Text(title)
                        .frame(width: 180, height: 50, alignment: .bottomLeading)
                        .foregroundColor(.white)
                        .font(Font.headline)
                    Text("$" + String(productPrice))
                        .frame(width: 180, height: 39, alignment: .topLeading)
                        .foregroundColor(Color.init(hex: "#FF6E4E"))
                        .font(Font.headline)
                }
                .frame(width: 180, height: 89, alignment: .bottomTrailing)
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 26, height: 90, alignment: .center)
                            .foregroundColor(Color.init(hex: "#282843"))
                            .cornerRadius(10)
                            .padding(.top, 20)
                        VStack {
                            Button {
                                if productCounter > 1 {
                                    productCounter -= 1
                                    removeProduct(price: price)
                                }else {
                                    deleteItem()
                                }
                                
                            } label: {
                                Image("baseline_remove_black_18pt")
                                    .foregroundColor(.white)
                            }
                            
                            Text(String(productCounter))
                                .foregroundColor(.white)
                            Button {
                                productCounter += 1
                                addProduct(price: price)
                            } label: {
                                Image("baseline_add_black_18pt")
                                    .foregroundColor(.white)
                            }
                        }.padding(.top, 20)
                    }
                }
                Button {
                    deleteItem()
                    total -= productPrice - price
                } label: {
                    Image("baseline_delete_outline_black_36pt")
                        .foregroundColor(Color(hex: "#36364D"))
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width / 3)
            .onAppear{
                productPrice = price
            }
//            .background(.pink)
    }
    func addProduct(price: Int) {
        productPrice += price
        total += price
    }
    func removeProduct(price: Int) {
        productPrice -= price
        total -= price
    }
    func deleteItem() {
        var temporaryVar = 0
        
        for i in 0..<selectedProducts.count{
            if selectedProducts[i].id == id {
                temporaryVar = i
                total -= selectedProducts[i].price
            }
        }
        selectedProducts.remove(at: temporaryVar)
    }
}

//struct ProductDataRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDataRow(urlString: "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig", title: "Samsung", price: 1000, selectedProducts: <#Binding<[DetailResponse]>#>)
//    }
//}
