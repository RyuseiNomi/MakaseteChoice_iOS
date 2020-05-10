//
//  MemberInputView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name:String
    var groupId:Int = 0
}

struct MemberCell: View {
    
    var member: Member
    
    var body: some View {
        ZStack() {
            HStack() {
                Image("Member")
                Text(member.name)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 16))
                Spacer()
                Button(action: {
                    // TODO メンバー削除
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
    @State private var countLimit:Int = 10
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            HStack() {
                Text("残り ")
                Text(String(self.countLimit))
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 30))
                Text("人まで")
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
            TextField("名前を入力", text: $name, onCommit: {
                if self.countLimit == 0 {
                    //TODO returnを押したタイミングでalertを表示
                    return
                }
                self.appState.addMember(member: Member(name: self.name, groupId: 0))
                self.countLimit = self.countLimit - 1
                self.name = ""
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            NavigationLink(destination: ShuffleOptionView()) {
                DecisionButton()
            }
        }
        .navigationBarTitle("メンバーの入力", displayMode: .inline)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
