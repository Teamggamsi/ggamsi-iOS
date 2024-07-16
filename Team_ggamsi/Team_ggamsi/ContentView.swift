//
//  ContentView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    init() {
            UIPageControl.appearance().currentPageIndicatorTintColor = .gray
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
        }
    var body: some View {
        TabView {
            FirstStartView()
                .tabItem {
                    Text("First")
                }
            SecondStartView()
                .tabItem {
                    Text("Second")
                }
            ThirdStartView()
                .tabItem {
                    Text("Third")
                }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ContentView()
}
