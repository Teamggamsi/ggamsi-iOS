//
//  TabbarView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/17/24.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { 
                    Image(systemName: "house.fill")
                    Text("홈")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("판매")
                }
            HomeView()
                .tabItem { 
                    Image(systemName: "heart")
                    Text("찜")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "person")
                    Text("내 정보")
                }
        }
    }
}

#Preview {
    TabbarView()
}
