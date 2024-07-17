//
//  SellWriteView.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/17/24.
//

import SwiftUI

struct SellWriteView: View {
    var body: some View {
        Text("판매글 작성하기")
            .font(.system(size: 20, weight: .regular))
        VStack(alignment:.leading) {
            Text("상품정보")
                .font(.system(size: 17, weight: .regular))
        }
    }
}

#Preview {
    SellWriteView()
}
