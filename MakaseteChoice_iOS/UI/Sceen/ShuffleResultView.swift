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
        HStack {
            VStack(alignment: .leading) {
                Text(self.member.name)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
            }
            Spacer()
            VStack {
                Text("グループ")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 14))
                Text(String(self.member.groupId))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 48))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 154/255, green: 205/255, blue: 50/255))
        .cornerRadius(10)
        //.shadow(color: .gray, radius: 1, x: 0, y: 5) //lightblue
    }
}

struct ShuffleResultView: View {
    
    @State var members:[Member] = []
    var groupNum:Int = 0
    @State var sortedMembers:[Member] = []
    @State private(set) var isCompletShuffle = false
    
    var body: some View {
        VStack() {
            if isCompletShuffle == false {
                Text("シャッフル中...")
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
            NavigationLink(destination: MemberInputView()) {
                RetryButton()
            }
        }
        .navigationBarTitle("シャッフル結果", displayMode: .inline)
        .onAppear(perform: { self.doShuffle() })
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
