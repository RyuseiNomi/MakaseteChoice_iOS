//
//  MemberInputView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid
import KeyboardObserving

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name:String
    var groupId:Int = 0
}

struct MemberCell: View {
    
    var member: Member
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        ZStack() {
            HStack() {
                Image("Member")
                Text(member.name)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 16))
                Spacer()
                Button(action: {
                    self.appState.deleteMember(name: self.member.name)
                }) {
                    Text("×")
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                        .font(Font.custom("Helvetica-Light", size: 20))
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

struct MemberInputView: View {
    @State private(set) var name = ""
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            HStack() {
                Text("入力したメンバー")
                Text(String(self.appState.memberObject.members.count))
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 30))
                Text("人")
            }
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 10, trailing:0))
            if self.appState.memberObject.members.isEmpty {
                Text("メンバーが入力されていません。")
            }
            QGrid(self.appState.memberObject.members,
                  columns: 2,
                  vSpacing: 15,
                  hSpacing: 5,
                  vPadding: 10,
                  hPadding: 10,
                  isScrollable: true
            ) { member in
                MemberCell(member: member)
            }
            HStack() {
                TextField("名前を入力", text: $name, onCommit: {
                    if self.name == "" {
                        return
                    }
                    self.appState.addMember(member: Member(name: self.name, groupId: 0))
                    self.name = ""
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
                NavigationLink(destination: ShuffleOptionView()) {
                    DecisionButton()
                }
                .disabled(!self.appState.memberObject.isMemberIsOverTwo)
                .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
        }
        .keyboardObserving()
        .navigationBarTitle("メンバーの入力", displayMode: .inline)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
