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
                .font(Font.custom("Helvetica-Light", size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
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
            Spacer()
            NavigationLink(destination: ShuffleResultView(member: self.member, groupNum: self.groupNum)) {
                DecisionButton()
            }
        }.navigationBarTitle("シャッフルオプション設定", displayMode: .inline)
    }
}
