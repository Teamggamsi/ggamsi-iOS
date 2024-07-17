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
                    .frame(width: 394, height: 150)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                HStack(spacing: 40) {
                    NavigationLink(destination: VegetableView()) {
                        VStack {
                            Rectangle()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay (
                                    Image(systemName: "carrot")
                                        .foregroundColor(.black)
                                        .frame(width:25,height: 25)
                                )
                            Text("채소")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView()) {
                        VStack {
                            Rectangle()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay (
                                    Image("appl")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width:25,height: 25)
                                )
                            Text("과일")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView()) {
                        VStack {
                            Rectangle()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay (
                                    Image(systemName: "fish")
                                        .foregroundColor(.black)
                                )
                            Text("해산물")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: VegetableView()) {
                        VStack {
                            Rectangle()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: "#F1F0F0"))
                                .cornerRadius(10)
                                .overlay (
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
                
                HStack {
                    Text("인기상품🏆")
                        .font(.system(size: 17))
                        .padding(.top, 5)
                        .padding(.leading, 36)
                    Spacer()
                }
                .padding(.top,5)
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(1...10, id: \.self) { i in
                            VStack {
                                ProductItem()
                                ProductItem()
                            }
                        }
                        .padding(.leading, 38)
                    }

                } .frame(height: 350)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom,40)
        }
        .navigationBarBackButtonHidden()
    }
}

struct ImageButton: View {
    let imageName: String
    
    var body: some View {
        Button(action: {
            
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
        VStack(alignment: .leading) {
            Image("apple")
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(5)
            Text("이뻐지고 싶사과")
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
