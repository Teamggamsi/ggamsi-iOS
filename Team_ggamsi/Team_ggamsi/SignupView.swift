//
//  SignupView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import SwiftUI
import Alamofire

struct SignupResponse: Codable {
    let result: Bool
    let token: String
}

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var nickname: String = ""
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
                            TextField("", text: $nickname)
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
                            TextField("", text: $email)
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
                            SecureField("", text: $password)
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
                            SecureField("", text: $confirmPassword)
                                .padding(.leading, 50)
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal, 50)
                        }
                    }
                    
                    Button(action: {
                        signup()
                    }) {
                        Text("회원가입")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .frame(width: 302, height: 63)
                            .background(Color.mainColor)
                            .cornerRadius(15)
                    }
                    .padding(.top, 35)
                    
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
                .background(
                    NavigationLink(destination: HomeView(), isActive: $showingHome) {
                        EmptyView()
                    }
                )
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func signup() {
        let parameters: [String: String] = [
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword,
            "nickname": nickname,
        ]
        
        AF.request("http://43.201.116.75:8080/api/register", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: SignupResponse.self) { response in
            switch response.result {
            case .success(let signupResponse):
                if signupResponse.result {
                    self.tokenManager.saveToken(signupResponse.token)
                    self.showingHome = true
                } else {
                    print("회원가입 실패")
                }
            case .failure(let error):
                print("Alamofire 오류: \(error)")
            }
        }
    }
}

#Preview {
    SignupView()
}
