import SwiftUI

struct PresentView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text("나눔")
                .font(.system(size:20))
                .padding(.top, 10)
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
            ScrollView {
                LazyVStack {
                    ForEach(1...10, id: \.self) { i in
                        HStack {
                            ProductItem3()
                            ProductItem3()
                        }
                    }
                    .padding(.leading, 36)
                }
                
            }
        }

    }
}

struct ProductItem3: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("tomato")
                .resizable()
                .cornerRadius(10)
                .frame(width: 140, height: 140)
            Text("나는야 멋쟁이 토마토")
                .font(.system(size: 13))
                .foregroundColor(Color.gray)
            Text("무료나눔")
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    PresentView()
}
