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
    // Pickerのポジションに関するState変数群
    @State public var currentOffset = CGFloat.zero
    @State public var openOffset = CGFloat.zero
    @State public var closeOffset = CGFloat.zero
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                VStack() {
                    //TODO 組分け数を決定するUIをモーダルなどに切り出す
                    HStack() {
                        if self.appState.memberObject.members.count != 0 {
                            Text("組分け数")
                                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                            Text(String(self.groupNum))
                                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                                .font(Font.custom("Helvetica-Light", size: 20))
                            Image(systemName: "chevron.down.square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                                .frame(maxWidth: 20, maxHeight: 20)
                                .onTapGesture {
                                    self.currentOffset = self.openOffset
                                }
                        }
                        Spacer()
                        Text("1グループあたり")
                            .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                            .font(Font.custom("Helvetica-Light", size: 12))
                        Text(String(self.appState.memberObject.members.count / self.groupNum))
                            .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                            .font(Font.custom("Helvetica-Light", size: 20))
                        Text("人")
                            .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                            .font(Font.custom("Helvetica-Light", size: 12))
                    }
                }
                .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
                GroupNumPicker(
                    groupNumber: self.groupNum,
                    membersCount: self.appState.memberObject.members.count,
                    currentOffset: self.$currentOffset,
                    openOffset: self.$openOffset,
                    closeOffset: self.$currentOffset
                )
                    .frame(height: geometry.size.height * 0.5)
                    .onAppear(perform: {
                        self.setInitPosition(viewHeight: geometry.size.height)
                    })
                    .offset(y: self.currentOffset)
                    .animation(.default)
            }
        }
    }
    
    // NumberPickerを画面の下に隠すために初期ポジションを設定する
    private func setInitPosition(viewHeight: CGFloat) {
        self.currentOffset = (viewHeight/2) + viewHeight
        self.closeOffset = self.currentOffset
        self.openOffset = ((viewHeight/2) * -1) + ((viewHeight * 0.5) / 2)
    }
    
    // NumberPickerの座標を書き換えることで出現させる
    private func toggleNumberPicker() {
            self.currentOffset = self.openOffset
    }
}

struct GroupNumPicker: View {
    
    @State public var groupNumber:Int
    public var membersCount:Int
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
                    self.currentOffset = 500
                }) {
                    Text("完了")
                }
            }
            Picker(selection: self.$groupNumber, label: Text("")) {
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
