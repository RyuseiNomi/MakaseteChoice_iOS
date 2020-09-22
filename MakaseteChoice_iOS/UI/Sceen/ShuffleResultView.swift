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
    @State var sortedMembers:[Member] = []
    @State private(set) var isCompletShuffle = false
    @State private var isShowingModal = false
    @EnvironmentObject public var appState: AppState

    var body: some View {
        VStack() {
            if self.appState.memberObject.members.count == 0 {
                NoMemberViewComponent(paragraphOne: "メンバーがいません", paragraphTwo: "「メンバー」メニューから", paragraphThree: "メンバーを追加しましょう")
            } else if isCompletShuffle == false {
                NoGroupViewComponent(paragraphOne: "グループがありません", paragraphTwo: "オプションを設定して", paragraphThree: "グループをチョイスしましょう")
            } else {
                QGrid(self.sortedMembers,
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
            if self.appState.memberObject.members.count != 0 {
                Spacer()
                VStack() {
                    ShuffleOptionView(groupNum: self.$groupNum)
                    Button(action: {
                        self.doShuffle()
                    }) {
                        DecisionButton(label: "チョイス")
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 30, trailing: 5))
                }
            }
        }
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
    }
    
    private func doShuffle(){
        var members = self.appState.memberObject.members
        var shuffledMember:[Member] = []
        self.isCompletShuffle = false
        
        // 配列のシャッフル
        members.shuffle()
        
        // シャッフルしたメンバーにgroupIDを割り当てる
        var groupId:Int = 1;
        for member in members {
            shuffledMember.append(Member(name: member.name, groupId: groupId))
            if groupId > self.groupNum - 1 {
                groupId = 1
                continue
            }
            groupId = groupId + 1
        }
        
        // GroupIDでメンバーをSortする
        self.sortedMembers = shuffledMember.sorted{ $0.groupId < $1.groupId }
        self.isCompletShuffle = true
    }
}
