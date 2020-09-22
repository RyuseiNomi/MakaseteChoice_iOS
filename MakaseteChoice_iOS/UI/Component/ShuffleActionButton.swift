//
//  ShuffleActionButton.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleActionButton: View {
    
    @State private var isShowingModal = false

    var body: some View {
        ZStack() {
            Button(action:{
                self.isShowingModal.toggle()
            }) {
                Image("Group")
                    .resizable()
                    .scaledToFit()
            }.sheet(isPresented: $isShowingModal) {
                ShuffleOptionView()
            }
                .frame(width: 60, height: 60)
                .background(Color.orange)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
        }
    }
}
