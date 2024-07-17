//
//  TabbarView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/17/24.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("홈")
                    }
                SellWriteView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("판매")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }
            }
            .background(.white)
            .accentColor(Color(hex: "#34C831"))
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TabbarView()
}
