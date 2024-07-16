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
                Spacer().frame(height: 160)
                
                Text("생산자와 소비자 개개인이")
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 0) {
                    
                    Text("직접")
                        .foregroundColor(.mainColor)
                    
                    Text(" 이어질 수 있도록")
                }
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                Image("thqlwk")
                    .resizable()
                    .frame(width: 319, height: 319)
                
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
    FirstStartView()
}
