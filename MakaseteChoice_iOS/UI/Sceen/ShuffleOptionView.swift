//
//  ShuffleOptionView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleOptionView: View {
    
    public var members:[Member] = []
    @State private(set) var selectedNum = 0
    @EnvironmentObject public var appState: AppState

    var body: some View {
        VStack() {
            Stepper(value: $selectedNum, in: 1...4) {
                Text("\(selectedNum)")
            }
        }
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
