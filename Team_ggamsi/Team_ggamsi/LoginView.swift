//
//  LoginView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import SwiftUI
import Alamofire

struct LoginResponse: Codable {
    let success: Bool
    let token: String
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingHome = false
    
    @ObservedObject private var tokenManager = TokenManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(hex: "#CECECE"))
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("안녕하세요 🙂")
                            .font(.system(size: 25, weight: .regular))
                            .padding(.horizontal, 50)
                        HStack(spacing: 0) {
                            Text("못난이")
                                .foregroundColor(.mainColor)
                            Text(" 입니다")
                        }
                        .font(.system(size: 25, weight: .regular))
                        .padding(.leading, 50)
                        .padding(.bottom, 130)
                        Text("이메일")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.leading, 50)
                        
                        VStack {
                            TextField("", text: $email)
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                        
                        Text("비밀번호")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(hex: "#6B6B6B"))
                            .padding(.top, 35)
                            .padding(.leading, 50)
                        
                        VStack {
                            SecureField("", text: $password)
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                                .padding(.bottom, 80)
                        }
                    }
                    
                    Button(action: {
                        login()
                    }) {
                        Text("로그인")
                            .font(.system(size: 23, weight: .regular))
                            .foregroundColor(.white)
                            .frame(width: 302, height: 63)
                            .background(Color.mainColor)
                            .cornerRadius(15)
                    }
                    .padding(.top, 40)
                    
                    Text("아직 회원가입이 되어 있지 않나요?")
                        .foregroundColor(Color(hex: "#6B6B6B"))
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top, 20)
                    
                    NavigationLink(destination: SignupView()) {
                        Text("회원가입 하러 가기")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(hex: "#34C831"))
                            .padding(.top, 1)
                    }
                    Spacer()
                }
                .background(
                    NavigationLink(destination: HomeView(), isActive: $showingHome) {
                        EmptyView()
                    }
                )
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func login() {
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]
        
        AF.request("http://43.201.116.75:8080/api/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let loginResponse):
                if loginResponse.success {
                    self.showingHome = true
                } else {
                    self.showingHome = false
                }
            case .failure(let error):
                print("네트워크 오류")
            }
        }
    }
}

#Preview {
    LoginView()
}
