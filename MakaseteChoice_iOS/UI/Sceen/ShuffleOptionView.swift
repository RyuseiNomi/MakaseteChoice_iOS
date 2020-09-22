//
//  ShuffleOptionView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleOptionView: View {

    @Binding public var groupNum: Int
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            //TODO 組分け数を決定するUIをモーダルなどに切り出す
            HStack() {
                Text("メンバー数")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                Text(String(self.appState.memberObject.members.count))
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 16))
                Text("人")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
            }
            HStack() {
                if self.appState.memberObject.members.count != 0 {
                    Text("組分け数")
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                    Stepper(value: $groupNum, in: 1...self.appState.memberObject.members.count) {
                        Text("\(groupNum)")
                    }
                }
            }
        }
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
    }
}
