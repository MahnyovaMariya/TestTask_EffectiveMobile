//
//  MyCart.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 10.12.2022.
//

import SwiftUI

struct MyCart: View {
    
    var selectedProduct: DetailResponse?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectedProducts = [DetailResponse]()
    @State var total = 0

    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1))
                DownLayer()
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible())]){
                            ForEach(selectedProducts, id: \.self) { productItem in
                                ProductDataRow(id: productItem.id, urlString: productItem.images[0], title: productItem.title, price: productItem.price, selectedProducts: $selectedProducts, total: $total)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 1 / 3, alignment: .center)
                    .padding(.top, 50)
                    Spacer()
                 }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 1 / 3, alignment: .center)
                VStack {
                    Spacer()
                    Line()
                    Total(total: total)
                    Delivery()
                    Line()
                    Checkout()
                }
                .padding(.bottom, 40)
            }
            .onAppear{
                if let id = Int(selectedProduct!.id) {
                    if id != 0 {
                        if selectedProducts.count == 0 {
                            selectedProducts.append(selectedProduct!)
                            total = selectedProduct!.price
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                ToolBar(text: "Add address", picture: "baseline_fmd_good_black_24pt")
            }
        }
    }
        
    var buttonBack: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: { LabelBackButton() }
    }
}

struct MyCart_Previews: PreviewProvider {
    static var previews: some View {
        MyCart(selectedProduct: DetailResponse(CPU: "Exynos 990", camera: "108 + 12 mp", capacity: ["126"], color: ["#772D03"], id: "3", images: ["https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig"], price: 9, rating: 4.5, sd: "256 GB", ssd: "8 GB", title: "Galaxy Note 20 Ultra"))
    }
}
