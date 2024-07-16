//
//  SecondStartView.swift
//  Team_ggamsi
//
//  Created by dgsw8th65 on 7/16/24.
//

import SwiftUI

struct ThirdStartView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 160)
                
                Text("상품성이 떨어지거나\n먹지 않는 식품을 더 편하게")
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 0) {
                    Text("나눔")
                        .foregroundColor(.mainColor)
                    
                    Text(" 할 수 있도록")    
                        
                }
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                Image("sksna")
                    .resizable()
                    .frame(width: 416, height: 311)
                
                Spacer()
                
                Button(action: {
                    // Button action here
                }) {
                    Text("계속하기")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 196, height: 62)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    ThirdStartView()
}
