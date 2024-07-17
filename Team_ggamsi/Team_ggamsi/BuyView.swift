import SwiftUI

struct BuyView: View {
    let product: Product
    @State private var isTouch: Bool = false
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 360)
                .background(
                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 393, height: 360)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                )
            
            Text(product.title)
                .font(.system(size: 22, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.leading, 25)
                .padding(.top, 10)
            
            Text("\(product.price ?? 0) 원")
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
            
            Button(action: {
                isPresented.toggle()
            }) {
                Text("구매하기")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .frame(width: 302, height: 63)
                    .background(Color(hex: "34C831"))
                    .cornerRadius(15)
                    .padding(.leading, 45)
            }
        }
        .modal(isPresented: $isPresented) {
            Text("Hello")
                .frame(height: 500)
        }
    }
}

#Preview {
    BuyView(product: Product(id: 1, title: "테스트", content: "테스트입니다.", delivery: 0, price: 1000, category: "테스트", image: "http://43.201.116.75:8080/api/cdn/images/209dc7c7aa3774fe316a9a50", author: "이채소"))
}
