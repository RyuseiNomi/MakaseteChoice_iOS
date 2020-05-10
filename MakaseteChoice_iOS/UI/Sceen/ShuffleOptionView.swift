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
    @State private(set) var groupNum:Int = 1
    
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
                    Image("Minus")
                }
                Text(String(self.groupNum))
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 48))
                Button(action: {
                    self.groupNum = self.groupNum + 1
                })
                {
                    Image("Plus")
                }
            }
            Spacer()
            NavigationLink(destination: ShuffleResultView(members: self.member, groupNum: self.groupNum)) {
                DecisionButton()
            }
        }
        .navigationBarTitle("シャッフルオプション設定", displayMode: .inline)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
