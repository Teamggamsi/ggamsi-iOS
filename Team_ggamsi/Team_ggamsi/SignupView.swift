//
//  SignupView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height:0.5)
                        .foregroundColor(Color(hex: "#CECECE"))
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("안녕하세요 🙂")
                            .font(.system(size: 25))
                            .padding(.horizontal, 50)
                        HStack(spacing: 0) {
                            Text("앱이름")
                                .foregroundColor(.mainColor)
                            Text(" 입니다")
                        }
                        .font(.system(size: 25))
                        .padding(.leading, 50)
                        .padding(.bottom, 25)
                        Text("사용자 이름")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.leading, 50)
                        
                        VStack {
                            TextField("", text:
                                    .constant(""))
                            .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                        
                        Text("이메일")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.top, 35)
                            .padding(.leading, 50)
                        
                        VStack {
                            SecureField("", text: .constant(""))
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                        
                        Text("비밀번호")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.top, 35)
                            .padding(.leading, 50)
                        
                        VStack {
                            SecureField("", text: .constant(""))
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                        
                        Text("비밀번호 확인")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.top, 35)
                            .padding(.leading, 50)
                        
                        VStack {
                            SecureField("", text: .constant(""))
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                    }
                    
                    Button(action: {
                        // action here
                    }) {
                        Text("회원가입")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .frame(width: 302, height: 63)
                            .background(Color.mainColor)
                            .cornerRadius(15)
                    }
                    .padding(.top, 35) // Adjusted the padding to replace the Spacer
                    
                    Text("이미 회원가입이 되어있나요?")
                        .foregroundColor(Color(hex: "#6B6B6B"))
                        .font(.system(size: 15))
                        .padding(.top, 20)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("로그인 하러 가기")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "#34C831"))
                            .padding(.top, 1)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignupView()
}
