import SwiftUI
import Alamofire

struct SearchView: View {
    @State private var searchText = "채소"
    @State private var products: ProductResponse? = nil

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
                    .onSubmit {
                        getSearchedList()
                    }
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                getSearchedList()
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
                Button(action: {
                    searchText = "사과"
                    getSearchedList()
                }) {
                    Text("사과")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: searchText == "사과" ? "34C831" : "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {
                    searchText = "연어"
                    getSearchedList()
                }) {
                    Text("연어")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: searchText == "연어" ? "34C831" : "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {
                    searchText = "고등어"
                    getSearchedList()
                }) {
                    Text("고등어")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: searchText == "고등어" ? "34C831" : "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
                Button(action: {
                    searchText = "파인애플"
                    getSearchedList()
                }) {
                    Text("파인애플")
                        .foregroundColor(.black)
                        .frame(width: 69, height: 25)
                        .background(Color(hex: searchText == "파인애플" ? "34C831" : "B6F0B5"))
                        .cornerRadius(20)
                        .font(.system(size: 13, weight: .regular))
                }
            }
            .padding(.top, 10)
            Spacer()
            
            if let products = products?.data {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(products) { product in
                            NavigationLink(destination: BuyView(product: product)) {
                                ProductItem2(product: product)
                                    .padding(.horizontal, 15)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                ProgressView()
            }
        }
    }
    
    func getSearchedList() {
        AF.request(
            "http://43.201.116.75:8080/api/product/search",
            method: .post,
            parameters: ["search": searchText],
            encoding: JSONEncoding.default
        )
        .responseDecodable(of: ProductResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.products = data
            case .failure(let error):
                print(error)
            }
        }
    }
}

#Preview {
    SearchView()
}
