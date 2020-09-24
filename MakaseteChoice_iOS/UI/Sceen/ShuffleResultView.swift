//
//  ShuffleResultView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct ShuffleResultView: View {
    
    @State private(set) var groupNum:Int = 1
    @State var group:[Member] = []
    @State private(set) var isCompletShuffle = false
    @State private var isShowingModal = false
    // Pickerのポジションに関するState変数群
    @State public var currentOffset = CGFloat.zero
    @State public var openOffset = CGFloat.zero
    @State public var closeOffset = CGFloat.zero
    @EnvironmentObject public var appState: AppState

    var body: some View {
        GeometryReader { geometry in
            VStack() {
                HStack() {
                    Text("チョイス結果")
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                        .font(Font.custom("Helvetica-Light", size: 25))
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 0))
                    Spacer()
                    Text("メンバー数: \(self.group.count)")
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                        .font(Font.custom("Helvetica-Light", size: 15))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 5))
                }
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 0))
                if self.appState.memberObject.members.count == 0 {
                    NoMemberViewComponent(paragraphOne: "メンバーがいません", paragraphTwo: "「メンバー」メニューから", paragraphThree: "メンバーを追加しましょう")
                } else if self.isCompletShuffle == false {
                    NoGroupViewComponent(paragraphOne: "グループがありません", paragraphTwo: "組分け数を設定して", paragraphThree: "グループをチョイスしましょう")
                } else {
                    GroupCell(members: self.group)
                }
                if self.appState.memberObject.members.count != 0 {
                    Spacer()
                    VStack() {
                        ShuffleOptionView(
                            groupNum: self.$groupNum,
                            currentOffset: self.$currentOffset,
                            openOffset: self.$openOffset,
                            closeOffset: self.$closeOffset
                        )
                        Button(action: {
                            let shuffleInteractor = ShuffleInteractor(appState: self.appState)
                            self.group = shuffleInteractor.doShuffle(groupNumber: self.groupNum)
                            self.isCompletShuffle = true
                        }) {
                            DecisionButton(label: "チョイスする", maxWidth: 200)
                        }
                        .padding(EdgeInsets(top: 15, leading: 5, bottom: 30, trailing: 5))
                    }
                }
            }
            .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
            GroupNumPicker(
                membersCount: self.appState.memberObject.members.count,
                viewHeight: geometry.size.height,
                groupNum: self.$groupNum,
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
    
    // NumberPickerを画面の下に隠すために初期ポジションを設定する
    private func setInitPosition(viewHeight: CGFloat) {
        self.currentOffset = viewHeight
        self.closeOffset = self.currentOffset
        self.openOffset = viewHeight - viewHeight*0.5
    }
    
    // NumberPickerの座標を書き換えることで出現させる
    private func toggleNumberPicker() {
        self.currentOffset = self.openOffset
    }
}

struct GroupCell: View {
    
    public var members:[Member]
    
    var body: some View {
        VStack() {
            //TODO グループごとにセクションを区切る
            QGrid(self.members,
                  columns: 1,
                  vSpacing: 25,
                  hSpacing: 0,
                  vPadding: 10,
                  hPadding: 20,
                  isScrollable: true
            ) { member in
                ResultMemberCell(member: member)
            }
        }
    }
}
