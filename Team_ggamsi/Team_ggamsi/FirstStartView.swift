//
//  SecondStartView.swift
//  Team_ggamsi
//
//  Created by dgsw8th65 on 7/16/24.
//

import SwiftUI

struct FirstStartView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("생산자와 소비자 개개인이")
                    .font(.system(size: 25, weight: .regular))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 0) {
                    
                    Text("직접")
                        .foregroundColor(.mainColor)
                    
                    Text(" 이어질 수 있도록")
                }
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            }
            .padding(.bottom, 400)
            
            VStack(spacing:70) {
                Image("thqlwk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 412, height: 274)
                    .padding(.bottom,40)
                
                NavigationLink(destination: LoginView()) {
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
    FirstStartView()
}
