//
//  ResultMemberCell.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ResultMemberCell: View {

    var member: Member
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        HStack() {
            Text(String(member.groupId))
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                .font(Font.custom("Helvetica", size: 30))
                .fontWeight(.black)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 15))
            HStack() {
                Image("Member")
                Text(member.name)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 20))
                Spacer()
                Button(action: {
                    self.appState.togglePin(name: self.member.name)
                }) {
                    if self.getMemberPinnedStatus() == false {
                        MemberPinned_Off()
                    } else {
                        MemberPinned_On()
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            .cornerRadius(10)
            .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
        }
    }
    
    /// ピン留めの対象となるメンバーの現在のピン留めステータスを取得
    private func getMemberPinnedStatus() -> Bool {
        let targetMemberIndex:Int? = self.appState.memberObject.members.index(where: { $0.name == member.name })
        // ピン留めしたユーザが既に削除されている場合はfalseを返す
        // Optional型の恩恵
        if targetMemberIndex == nil {
            print("削除されたユーザを選択")
            return false
        }
        let targetMember: Member = self.appState.memberObject.members[targetMemberIndex!]
        return targetMember.isPinned
    }
}

struct MemberPinned_Off: View {
    var body: some View {
        Image(systemName: "pin")
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 15))
    }
}

struct MemberPinned_On: View {
    var body: some View {
        Image(systemName: "pin.fill")
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 15))
    }
}
