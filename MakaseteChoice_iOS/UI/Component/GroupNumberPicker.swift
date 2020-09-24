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
    public var viewHeight:CGFloat
    @Binding public var groupNum:Int
    // Pickerのポジションに関するState変数群
    @Binding public var currentOffset:CGFloat
    @Binding public var openOffset:CGFloat
    @Binding public var closeOffset:CGFloat
    
    var body: some View {
        VStack() {
            HStack() {
                Text("組分け数を選択")
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                    .font(Font.custom("Helvetica-Light", size: 12))
                Button(action: {
                    self.currentOffset = self.viewHeight
                }) {
                    Text("完了")
                }
            }
            Picker(selection: self.$groupNum, label: Text("")) {
                ForEach(1..<self.membersCount) {
                    Text("\($0)")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
        .background(Color.white)
    }
    
    // NumberPickerの座標を書き換えることで出現させる
    private func toggleNumberPicker() {
        self.currentOffset = self.closeOffset
    }
}

