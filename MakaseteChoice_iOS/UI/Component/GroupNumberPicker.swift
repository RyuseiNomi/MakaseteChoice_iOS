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
            Button(action: {
                self.isShowingModal.toggle()
            }) {
                HStack() {
                    Spacer()
                    Text("完了")
                }
            }
            
            Picker(selection: $groupNum, label: Text("")) {
                ForEach( 1 ..< self.membersCount ) {
                    Text("\($0)")
                }
            }
            .frame(width: 200)
            .labelsHidden()
        }
        .background(Color.white)
    }
}

