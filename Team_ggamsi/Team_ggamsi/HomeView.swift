//
//  HomeView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var tokenManager = TokenManager.shared
    var body: some View {
        if let token = tokenManager.token {
            Text("저장된 토큰: \(token)")
                .font(.title)
                .padding()
        } else {
            Text("토큰이 없습니다.")
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    HomeView()
}
