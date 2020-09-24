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
    @Binding public var isShowingPicker: Bool
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        HStack(alignment: .center) {
            if self.appState.memberObject.members.count != 0 {
                Text("組分け数")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                    .font(Font.custom("Helvetica", size: 20))
                Spacer()
                Text(String(self.groupNum))
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                    .font(Font.custom("Helvetica", size: 30))
                    .fontWeight(.black)
                Spacer()
                Image(systemName: "chevron.down.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                    .frame(maxWidth: 20, maxHeight: 20)
                    .onTapGesture {
                        self.isShowingPicker.toggle()
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 80, bottom: 10, trailing: 80))
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
    }
    
}

