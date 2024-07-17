import SwiftUI

struct SellWriteView: View {
    
    @State private var productname: String = ""
    @State private var category: String = ""
    @State private var explanation: String = ""
    @State private var price: Int = 0
    @State private var boxprice: Int = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("판매글 작성하기")
                .font(.system(size: 20, weight: .regular))
                .padding(.leading, 130)
            
            VStack(alignment:.leading) {
                Text("상품정보")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.leading, 20)
                
                Button(action: {
                    // 카메라 버튼 액션
                }) {
                    Rectangle()
                        .frame(width: 53, height: 53)
                        .foregroundColor(Color(hex: "#D9D9D9"))
                        .overlay(
                            Image(systemName: "camera.fill")
                                .foregroundColor(.black)
                        )
                        .cornerRadius(10)
                        .padding(.leading, 23)
                        .padding(.bottom, 30)
                        .padding(.top, 10)
                }
                
                TextField("상품명", text: $productname)
                    .padding(.leading, 40)
                    .font(.system(size: 13, weight: .regular))
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                TextField("카테고리", text: $category)
                    .padding(.leading, 40)
                    .padding(.top, 10)
                    .font(.system(size: 13, weight: .regular))
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Text("설명")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 10)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 330, height: 118)
                    .background(Color(hex: "#F0F0F0"))
                    .cornerRadius(10)
                    .padding(.leading, 31)
                    .overlay(
                        TextField("", text: $explanation)
                            .font(.system(size: 13, weight: .regular))
                            .padding(.leading, 50)
                            .padding(.bottom, 65)
                    )
                
                Text("태그")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 5)
                
                HStack(spacing: 13) {
                    ForEach(0..<4) { _ in
                        Button(action: {}) {
                            Text("")
                                .foregroundColor(.black)
                                .frame(width: 41, height: 16)
                                .background(Color(hex: "B6F0B5"))
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.leading, 44)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 10)
                    .background(Color(hex: "D9D9D9"))
                    .padding(.top, 10)
                
                Text("가격")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 20)
                
                ZStack(alignment: .leading) {
                    if price == 0 {
                        Text("₩ 가격")
                            .foregroundColor(Color(hex: "D9D9D9"))
                            .padding(.leading, 44)
                            .padding(.top, 5)
                            .font(.system(size: 13, weight: .regular))
                    }
                    TextField("", text: Binding(
                        get: { price == 0 ? "" : String(price) },
                        set: { price = Int($0) ?? 0 })
                    )
                    .padding(.leading, 40)
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .font(.system(size: 13, weight: .regular))
                    .keyboardType(.numberPad)
                }
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Text("택배비")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 15)
                ZStack(alignment: .leading) {
                    if boxprice == 0 {
                        Text("₩ 택배비")
                            .foregroundColor(Color(hex: "D9D9D9"))
                            .padding(.leading, 44)
                            .padding(.top, 5)
                            .font(.system(size: 13, weight: .regular))
                    }
                    TextField("", text: Binding(
                        get: { boxprice == 0 ? "" : String(boxprice) },
                        set: { boxprice = Int($0) ?? 0 })
                    )
                    .padding(.leading, 40)
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .font(.system(size: 13, weight: .regular))
                    .keyboardType(.numberPad)
                }
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("추가하기")
                        .frame(width: 302, height: 63)
                        .foregroundColor(.white)
                        .background(Color(hex: "34C831"))
                        .cornerRadius(15)
                        .font(.system(size: 23, weight: .regular))
                })
                .padding(.leading, 45)
                .padding(.top, 30)
            }
        }
    }
}

#Preview {
    SellWriteView()
}
