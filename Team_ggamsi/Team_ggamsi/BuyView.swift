//
//  BuyView.swift
//  Team_ggamsi
//
//  Created by dgsw8th65 on 7/17/24.
//

import SwiftUI

struct BuyView: View {
    
    @State private var isTouch: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 360)
                .background(
                    Image("onion")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393, height: 360)
                        .clipped()
                )
            
            Text("양파")
                .font(.system(size: 22, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.leading, 25)
                .padding(.top, 10)
            
            Text("10,000원")
                .font(.system(size: 25, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.leading, 22)
                .padding(.top, 1)
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 10)
                .background(Color(hex: "D9D9D9"))
                .padding(.top, 10)
            
            
            if isTouch {
                HStack(spacing: 61) {
                    
                    VStack {
                        Text("상세정보")                 
                        Rectangle()
                            .frame(width: 142, height: 1)
                    }
                    VStack {
                        Text("상점정보/후기")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onTapGesture {
                    isTouch = false
                }
            } else {
                HStack(spacing: 61) {
                    
                    VStack {
                        Text("상세정보")
                    }
                    VStack {
                        Text("상점정보/후기")
                        Rectangle()
                            .frame(width: 142, height: 1)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onTapGesture {
                    isTouch = true
                }
            }
        
        
        Button(action: {}) {
            Text("구매하기")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.white)
                .frame(width: 302, height: 63)
                .background(Color(hex: "34C831"))
                .cornerRadius(15)
                .padding(.leading, 45)
        }
        
    }
}
}

#Preview {
    BuyView()
}
