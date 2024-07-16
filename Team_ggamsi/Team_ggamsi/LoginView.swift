import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height:0.5)
                    .foregroundColor(Color(hex: "#CECECE"))
                    .padding(.top,30)
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
                    .padding(.bottom, 130)
                    Text("이메일")
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
                            .padding(.bottom, 80)
                    }
                }
                
                Button(action: {
                    // action here
                }) {
                    Text("로그인")
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                        .frame(width: 302, height: 63)
                        .background(Color.mainColor)
                        .cornerRadius(15)
                }
                .padding(.top, 40) // Adjusted the padding to replace the Spacer
                
                Text("아직 회원가입이 되어 있지 않나요?")
                    .foregroundColor(Color(hex: "#6B6B6B"))
                    .font(.system(size: 15))
                    .padding(.top, 20)
                
                Text("회원가입 하러 가기")
                    .font(.system(size: 15))
                    .foregroundColor(Color(hex: "#34C831"))
                    .padding(.top, 1)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
