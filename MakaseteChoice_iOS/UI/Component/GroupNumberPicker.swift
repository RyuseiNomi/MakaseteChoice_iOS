//
//  GroupNumberPicker.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/24.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct GroupNumPicker: View {
    
    public var membersCount:Int
    @Binding public var isShowingModal: Bool
    @Binding public var groupNum:Int

    var body: some View {
        VStack() {
            HStack() {
                Text("組み合わせ数を選択")
                    .foregroundColor(Color.gray) // whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 16))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                Button(action: {
                    self.isShowingModal.toggle()
                }) {
                    HStack() {
                        Spacer()
                        Text("完了")
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }

            Picker(selection: $groupNum, label: Text("")) {
                ForEach( 0 ..< self.membersCount+1 ) {
                    if $0 != 0 {
                        Text("\($0)")
                    }
                }
            }
            .frame(width: 200)
            .background(Color.white) // silver
            
            HStack() {
                Text("1グループあたり")
                    .foregroundColor(Color.gray) // whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 12))
                Text(String(self.membersCount / self.groupNum))
                    .foregroundColor(Color.gray) //whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 20))
                Text("人")
                    .foregroundColor(Color.gray) // whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 12))
            }
        }
        .background(Color.white)
        .cornerRadius(30)
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
    }
}

