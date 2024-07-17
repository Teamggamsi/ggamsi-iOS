import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text("검색창")
                .font(.system(size: 20, weight: .regular))
                .padding(.top, 10)
            
            HStack {
                TextField("검색", text: $searchText)
                    .padding(.leading, 10)
                    .frame(width: 341, height: 45)
                    .background(Color(hex: "#F4F4F4"))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                // Search button action
                                print("Search button pressed")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    )
            }
            .padding(.top, 15)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 393, height: 1)
              .background(Color(hex: "D9D9D9"))
            
            HStack(spacing: 15) {
                Button(action: {}) {
                    Text("채소")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: "34C831"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {}) {
                    Text("과일")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {}) {
                    Text("해산물")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {}) {
                    Text("나눔")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
            }
            .padding(.top, 10)
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
