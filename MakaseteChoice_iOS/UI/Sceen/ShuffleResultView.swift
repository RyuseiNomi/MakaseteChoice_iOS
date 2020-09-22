//
//  ShuffleResultView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct ResultMemberCell: View {
    var member: Member
    
    var body: some View {
        ZStack() {
            HStack() {
                Image("Member")
                Text(member.name)
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 16))
                Spacer()
                VStack() {
                    Text("グループ")
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                        .font(Font.custom("Helvetica-Light", size: 12))
                    Text(String(member.groupId))
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                        .font(Font.custom("Helvetica", size: 20))
                        .bold()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing:5))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        }
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}

struct ShuffleResultView: View {
    
    @State var members:[Member] = []
    var groupNum:Int = 0
    @State var sortedMembers:[Member] = []
    @State private(set) var isCompletShuffle = false
    @State private var isShowingModal = false

    var body: some View {
        VStack() {
            if isCompletShuffle == false {
                Text("シャッフル中...")
            }
            if self.members == [] {
                Text("グループがありません。")
            }
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
            Spacer()
            HStack() {
                Spacer()
                ShuffleActionButton()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30.0, trailing: 30.0))
            }
        }
        .onAppear(perform: { self.doShuffle() })
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
    }
    
    private func doShuffle(){
        var shuffledMember:[Member] = []
        self.isCompletShuffle = false
        
        // 配列のシャッフル
        self.members.shuffle()
        
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
