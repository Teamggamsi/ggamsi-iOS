import SwiftUI
import Alamofire

struct VegetableView: View {
    @State private var searchText = ""
    @State private var isLoading = true
    @State private var products: [Product] = []
    var category: String
    
    var body: some View {
        VStack {
            Text(category)
                .font(.system(size: 20))
                .padding(.top, 10)
                .multilineTextAlignment(.center)
            
            SearchBarView(searchText: $searchText, onSearchButtonClicked: {
                print("Search button pressed")
                fetchProducts()
            })
            .padding(.bottom, 20)
            
            if isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(products) { product in
                            ProductItem2(product: product)
                                .padding(.horizontal, 15)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            fetchProducts()
        }
    }
    
    private func fetchProducts() {
        let parameters: [String: Any] = ["category": category]
        
        AF.request("\(api)/product/products/category", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: ProductResponse.self) { response in
                switch response.result {
                case .success(let productResponse):
                    self.products = productResponse.data
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
    }
}

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let content: String?
    let delivery: Int?
    let price: Int?
    let category: String
    let image: String
    let author: String?
}

struct ProductResponse: Decodable {
    let success: Bool
    let data: [Product]
}

struct ProductItem2: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImage(url: URL(string: product.image)) {image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width:140, height: 140)
            .cornerRadius(10)
            
            Text(product.title)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            Text("\(product.price ?? 0) 원")
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("검색", text: $searchText)
                .padding(.leading, 10)
                .frame(width: 341, height: 45)
                .background(Color(hex: "#D9D9D9"))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            onSearchButtonClicked()
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                        }
                    }
                )
        }
    }
}

#Preview {
    VegetableView(category: "채소")
}

