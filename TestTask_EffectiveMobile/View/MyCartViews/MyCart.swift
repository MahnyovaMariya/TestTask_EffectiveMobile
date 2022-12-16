//
//  MyCart.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 10.12.2022.
//

import SwiftUI

struct MyCart: View {
    
    var selectedProduct: DetailResponse?
    var anotherProduct = DetailResponse(CPU: "", camera: "", capacity: [], color: [], id: "", images: ["baseline_question_mark_black_18pt"], price: 0, rating: 0.0, sd: "", ssd: "", title: "")
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var selectedProducts = [DetailResponse]()
    @State var coincidence = 0
    @State var coincidenceSumProducts = 0
    @State var counter = 0
    @State var sumProduct = [ProductSum]()
    @State var total = 0
    @State var countOtElements = 0
//    @State var productCounterState = 0
//    @State var productSumState = 0

    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1))
                VStack {
                    HStack {
                        Text("My Cart")
                            .foregroundColor(Color.init(hex: "#010035"))
                            .font(Font.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 40)
                    .padding(.top, 60)
                    Spacer()
                    
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 2 / 3, alignment: .center)
                            .foregroundColor(Color.init(hex: "#010035"))
                    
                    }
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible())]){
                            ForEach(selectedProducts, id: \.self) { productItem in
//                                var productCounter = 1
//                                var productSum = productItem.price
                                ProductDataRow(id: productItem.id, urlString: productItem.images[0], title: productItem.title, price: productItem.price, selectedProducts: $selectedProducts, total: $total)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 1 / 3, alignment: .center)
                    .padding(.top, 50)
                    Spacer()
                 }//vstack
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 1 / 3, alignment: .center)
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 1, alignment: .center)
                        .foregroundColor(Color(UIColor(red: 0.252, green: 0.249, blue: 0.396, alpha: 1)))
                    HStack {
                        Text("Total")
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.leading, 40)
                        Spacer()
                        Text("$" + String(total))
                            .foregroundColor(.white)
                            .font(Font.headline)
                            .bold()
                            .padding(.top, 10)
                        Text("US")
                            .foregroundColor(.white)
                            .font(Font.footnote)
                            .bold()
                            .padding(.top, 10)
                            .padding(.trailing, 20)
                    }
                    HStack {
                        Text("Delivery")
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.leading, 40)
                        Spacer()
                        Text("Free")
                            .foregroundColor(.white)
                            .font(Font.headline)
                            .bold()
                            .padding(.top, 10)
                            .padding(.trailing, 60)
                    }
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 1, alignment: .center)
                        .foregroundColor(Color(UIColor(red: 0.252, green: 0.249, blue: 0.396, alpha: 1)))
                    
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
                .padding(.bottom, 40)
                
            }
            .onAppear{
                if let id = Int(selectedProduct!.id) {
                    if id != 0 {
                        if selectedProducts.count == 0 {
                            selectedProducts.append(selectedProduct!)
                            total = selectedProduct!.price
                        } else {
                            for i in 0..<selectedProducts.count {
                                //здесь тоже нужно обработать total переход в корзину с любй страницы
                                if selectedProducts[i].id == selectedProduct?.id {
                                    coincidence += 1
                                }
                            }
                            if coincidence == 0 {
                                selectedProducts.append(selectedProduct!)
                            }
                            coincidence = 0
                        }
                        
                        counter += 1
                    }
                    
                }
                
                countOtElements = selectedProducts.count
                print(selectedProducts)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Add address")
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#010035"))
                    
                    Button {
                        print("")
                    } label: {
                        Image("baseline_fmd_good_black_24pt")
                            .frame(width: 37, height: 37, alignment: .center)
                            .background(Color.init(hex: "#FF6E4E"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing, 10)
                    }
                }
            }
        }
        
    }
        
    
    var buttonBack: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image("outline_arrow_back_ios_black_20pt")
                .frame(width: 37, height: 37, alignment: .center)
                .background(Color.init(hex: "#010035"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.leading, 10)
        }

    }
    
    func getSumProduct(id: String, price: Int, _ productCounter: Int) -> Int {
        @State var v = 0
        let sum = price * counter
        let product = ProductSum(id: id, sum: sum)
        fillSumProductArray(product: product)
        return sum
    }
    
    func fillSumProductArray(product: ProductSum) {
        if sumProduct.count == 0 {
            sumProduct.append(product)
            total += product.sum
        } else {
            for i in 0..<sumProduct.count {
                
                if sumProduct[i].id == product.id {
                    sumProduct[i].sum = product.sum
                }
                total += sumProduct[i].sum
            }
        }
    }
    
    func getTotalSum(productsSumArray: [ProductSum]) {
        print(productsSumArray.count)
        for product in productsSumArray {
            total += product.sum
        }
    }
}

struct MyCart_Previews: PreviewProvider {
    static var previews: some View {
        MyCart(selectedProduct: DetailResponse(CPU: "Exynos 990", camera: "108 + 12 mp", capacity: ["126"], color: ["#772D03"], id: "3", images: ["https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig"], price: 9, rating: 4.5, sd: "256 GB", ssd: "8 GB", title: "Galaxy Note 20 Ultra"))
    }
}
