//
//  ViewExt.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/17/24.
//

import SwiftUI

@available(macOS 12, iOS 15, *)
public extension View {
  
  @ViewBuilder func modal<C: View>(isPresented: Binding<Bool>,
                                   @ViewBuilder content: @escaping () -> C) -> some View {
    ModalView(isPresented: isPresented, content: content) {
      self
    }
  }
}