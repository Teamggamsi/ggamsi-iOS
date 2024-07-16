//
//  SecondStartView.swift
//  Team_ggamsi
//
//  Created by dgsw8th65 on 7/16/24.
//

import SwiftUI

struct SecondStartView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("상품성이 떨어지는 식품을")
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 0) {
                    Text("더 값싸게 ")
                    
                    Text(" 구매")
                        .foregroundColor(.mainColor)
                    
                    Text(" 할 수 있도록")
                    
                }
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            }
            .padding(.bottom,400)
            
            VStack(spacing:70) {
                Image("shdqn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 412, height: 274)
                    .padding(.bottom,40)
                
                
                Button(action: {
                    
                }) {
                    Text("계속하기")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 196, height: 62)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                }
            }
            .padding(.top,200)
        }
        .padding(.bottom,50)
    }
}

#Preview {
    SecondStartView()
}
