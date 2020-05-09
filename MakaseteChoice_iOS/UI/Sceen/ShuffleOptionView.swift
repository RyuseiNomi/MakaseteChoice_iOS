//
//  ShuffleOptionView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleOptionView: View {
    
    var member:[Member] = []
    @State private(set) var groupNum:Int = 0
    
    var body: some View {
        VStack() {
            Text("グループ数")
            HStack() {
                Button(action: {
                    self.groupNum = self.groupNum - 1
                })
                {
                    Text("-")
                }
                Text(String(self.groupNum))
                Button(action: {
                    self.groupNum = self.groupNum + 1
                })
                {
                    Text("＋")
                }
            }
            NavigationLink(destination: ShuffleResultView(member: self.member)) {
                DecisionButton()
            }
        }
    }
}
