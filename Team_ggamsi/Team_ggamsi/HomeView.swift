import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 75, height: 47)
                        .padding(.leading, 40)
                        .padding(.top, 10)
                    Spacer()
                }
                
                Image("main")
                    .resizable()
                    .frame(width: 394, height: 200)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                HStack(spacing: 40) {
                    VStack {
                        ImageButton(imageName: "back")
                        Text("채소")
                            .font(.system(size: 10))
                    }
                    VStack {
                        ImageButton(imageName: "back")
                        Text("과일")
                            .font(.system(size: 10))
                    }
                    VStack {
                        ImageButton(imageName: "back")
                        Text("해산물")
                            .font(.system(size: 10))
                    }
                    VStack {
                        ImageButton(imageName: "back")
                        Text("나눔")
                            .font(.system(size: 10))
                    }
                }
                .padding(.top, 5)
                
                HStack {
                    Text("인기상품🏆")
                        .font(.system(size: 17))
                        .padding(.top, 5)
                        .padding(.leading, 36)
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    ForEach(0..<2) { _ in
                        HStack() {
                            ProductItem()
                            ProductItem()
                        }
                    }
                }
                .padding(.leading, 36)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        .navigationBarBackButtonHidden()
    }
}

struct ImageButton: View {
    let imageName: String
    
    var body: some View {
        Button(action: {
            // 버튼 클릭 시 동작 추가
        }) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color(hex: "#F1F0F0"))
                .cornerRadius(10)
        }
    }
}

struct ProductItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("apple")
                .resizable()
                .frame(width: 120, height: 120)
            Text("상품이름")
                .font(.system(size: 13))
                .foregroundColor(Color.gray)
            Text("3000원")
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

