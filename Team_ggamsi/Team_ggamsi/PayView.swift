//
//  PayView.swift
//  Team_ggamsi
//
//  Created by dgsw8th65 on 7/17/24.
//

import SwiftUI

struct PayView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let productImage: String
    let productName: String
    let productQuantity: Int
    let productPrice: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("주문서 작성")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 393, height: 10)
                        .background(Color(hex: "#D9D9D9"))
                        .padding(.top, 10)
                    
                    Text("배송지")
                        .font(.system(size: 17, weight: .medium))
                        .padding(.leading, 25)
                        .padding(.top, 50)
                    
                    HStack(spacing: 15) {
                        Button(action: {}) {
                            Text("대구소프트웨어마이스터고등학교")
                                .foregroundColor(.white)
                                .frame(width: 76, height: 23)
                                .background(Color(hex: "34C831"))
                                .cornerRadius(20)
                                .font(.system(size: 10, weight: .regular))
                        }
                        Button(action: {}) {
                            Text("대구 달성구 구지면 창리로")
                                .foregroundColor(Color(hex: "797979"))
                                .frame(width: 76, height: 23)
                                .background(Color(hex: "D9D9D9"))
                                .cornerRadius(20)
                                .font(.system(size: 10, weight: .regular))
                        }
                    }
                    .padding(.leading, 23)
                    .padding(.top, 5)
                    
                    Text("이유정")
                        .font(.system(size: 17, weight: .regular))
                        .padding(.top, 30)
                        .padding(.leading, 25)
                    
                    Text("010-5914-7181")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(Color(hex: "797979"))
                        .padding(.top, 5)
                        .padding(.leading, 27)
                    
                    Text("대구 달성군 창리로 11길 93 (대구소프트웨어고등학교)\n무인택배함 앞")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.black)
                        .padding(.top, 1)
                        .padding(.leading, 27)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 393, height: 10)
                        .background(Color(hex: "#D9D9D9"))
                        .padding(.top, 20)
                    
                    Text("상품정보")
                        .font(.system(size: 17, weight: .medium))
                        .padding(.top, 15)
                        .padding(.leading, 30)
                    
                    HStack(alignment: .top){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                                AsyncImage(url: URL(string: productImage)) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                            )
                            .cornerRadius(5)
                            .padding(.leading, 25)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading){
                            Text(productName)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.top, 15)
                            Spacer()
                                .frame(height: 5)
                            
                            Text("수량 \(productQuantity)개")
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("\(productPrice * productQuantity)원")
                                .font(.system(size: 24, weight: .regular))
                                .padding(.top, 15)
                                .padding(.leading, 130)
                        }
                        .padding(.leading, 10)
                    }
                }
                .padding(.bottom,50)
                Button(action: {}) {
                    Text("결제하기")
                        .font(.system(size: 24, weight: .regular))
                        .foregroundColor(.white)
                        .frame(width: 302, height: 63)
                        .background(Color(hex: "34C831"))
                        .cornerRadius(15)
                }
                Spacer()
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            })
        }
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    PayView(productImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxPoi0fALopQqvBEMq6A4-EETjJ_WjVhycJg&s", productName: "양파", productQuantity: 2, productPrice: 1000)
}
