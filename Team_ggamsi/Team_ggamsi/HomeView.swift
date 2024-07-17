import SwiftUI
import Alamofire

struct HomeView: View {
    @State private var popularProducts: [APIProduct] = []
    
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
                    .frame(width: 394, height: 150)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                // Category Section
                HStack(spacing: 40) {
                    NavigationLink(destination: VegetableView(category: "채소")) {
                        VStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay(
                                    Image(systemName: "carrot")
                                        .foregroundColor(.black)
                                )
                            Text("채소")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView(category: "과일")) {
                        VStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay(
                                    Image("appl")
                                        .resizable()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(.black)
                                )
                            Text("과일")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView(category: "해산물")) {
                        VStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay(
                                    Image(systemName: "fish")
                                        .foregroundColor(.black)
                                )
                            Text("해산물")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView(category: "나눔")) {
                        VStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay(
                                    Image(systemName: "gift")
                                        .foregroundColor(.black)
                                )
                            Text("나눔")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.top, 20)
                
                // Popular Products Section
                HStack {
                    Text("인기상품🏆")
                        .font(.system(size: 17))
                        .padding(.top, 5)
                        .padding(.leading, 40)
                    Spacer()
                }
                .padding(.top, 5)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(popularProducts, id: \.id) { product in
                            ProductItem(product: product)
                                .frame(width: 130, height: 180)
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .frame(height:340)
                .padding(.leading, 23)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 40)
            .onAppear {
                fetchPopularProducts()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func fetchPopularProducts() {
        let url = "\(api)/product/products/popular"
        
        AF.request(url, method: .post)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let productsResponse):
                    self.popularProducts = productsResponse.data
                case .failure(let error):
                    print("Error fetching products: \(error)")
                }
            }
    }
}

struct ProductItem: View {
    let product: APIProduct
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .cornerRadius(10)
            
            Text(product.title)
                .font(.system(size: 13))
                .foregroundColor(Color.gray)
            
            Text("\(product.price)원")
                .font(.system(size: 15))
        }
    }
}

struct APIProduct: Identifiable, Decodable {
    let id: Int
    let title: String
    let content: String
    let delivery: Int
    let price: Int
    let category: String
    let image: String
    let author: String
}

struct ProductsResponse: Decodable {
    let success: Bool
    let data: [APIProduct]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
