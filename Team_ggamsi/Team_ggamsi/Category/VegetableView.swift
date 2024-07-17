import SwiftUI

struct VegetableView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text("채소")
                .font(.system(size:20))
                .multilineTextAlignment(.center)
            HStack {
                TextField("", text: $searchText)
                    .padding(.leading, 10)
                    .frame(width: 341, height: 45)
                    .background(Color(hex: "#D9D9D9"))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                // Search button action
                                print("Search button pressed")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                        }
                    )
                
            }
            .padding(.bottom, 20)
            VStack(spacing: 20) {
                ForEach(0..<3) { _ in
                    HStack() {
                        ProductItem2()
                        ProductItem2()
                    }
                    .padding(.leading, 36)
                }
            }
        }

    }
}

struct ProductItem2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("apple")
                .resizable()
                .cornerRadius(10)
                .frame(width: 140, height: 140)
            Text("상품이름")
                .font(.system(size: 13))
                .foregroundColor(Color.gray)
            Text("3000원")
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VegetableView()
}
